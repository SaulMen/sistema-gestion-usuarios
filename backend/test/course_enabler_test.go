package test

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"main/src"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type courseEnabler struct {
	CourseId           string `json:"course_id"`
	Semester           string `json:"semester"`
	ProfessorId        string `json:"professor_id"`
	EnrollmentCapacity string `json:"enrollment_capacity"`
	CourseSection      string `json:"course_section"`
}

func TestSuccessAddCourse(t *testing.T) {
	courseEnabler := courseEnabler{
		CourseId:           "348",
		Semester:           "1S",
		ProfessorId:        "4",
		EnrollmentCapacity: "110",
		CourseSection:      "Q",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"El curso %s ha sido habilitado para asignación"}`,
		courseEnabler.CourseId,
	)
	r := gin.Default()
	r.POST("/addCourse", src.AddCourse)

	value, _ := json.Marshal(courseEnabler)
	req, _ := http.NewRequest("POST", "/addCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// Parámetro con valor negativo
func TestErrorAddCourse(t *testing.T) {
	courseEnabler := courseEnabler{
		CourseId:           "348",
		Semester:           "1S",
		ProfessorId:        "4",
		EnrollmentCapacity: "-110",
		CourseSection:      "Q",
	}

	mockResponse := `{"error":"El cupo máximo debe ser un número entero positivo","success":""}`
	r := gin.Default()
	r.POST("/addCourse", src.AddCourse)

	value, _ := json.Marshal(courseEnabler)
	req, _ := http.NewRequest("POST", "/addCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
