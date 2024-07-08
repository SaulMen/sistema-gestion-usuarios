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

type assignment struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	CareerId      string `json:"career_id"`
}

func TestSuccessCourseAssignment(t *testing.T) {
	assignment := assignment{
		CourseId:      "69",
		Semester:      "1S",
		CourseSection: "B",
		StudentId:     "201900001",
		CareerId:      "2",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"%s se asignó al curso %s con éxito"}`,
		assignment.StudentId,
		assignment.CourseId,
	)
	r := gin.Default()
	r.POST("/courseAssignment", src.CourseAssignment)

	value, _ := json.Marshal(assignment)
	req, _ := http.NewRequest("POST", "/courseAssignment", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// El ciclo no es 1S, 2S, VJ, VD
func TestErrorCourseAssignment(t *testing.T) {
	assignment := assignment{
		CourseId:      "69",
		Semester:      "3S",
		CourseSection: "B",
		StudentId:     "20240009",
		CareerId:      "2",
	}

	mockResponse := `{"error":"El formato del ciclo no es válido","success":""}`
	r := gin.Default()
	r.POST("/courseAssignment", src.CourseAssignment)

	value, _ := json.Marshal(assignment)
	req, _ := http.NewRequest("POST", "/courseAssignment", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
