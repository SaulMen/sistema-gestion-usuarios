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

type unassignment struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	CareerId      string `json:"career_id"`
}

func TestSuccessCourseUnassignment(t *testing.T) {
	unassignment := unassignment{
		CourseId:      "69",
		Semester:      "1S",
		CourseSection: "B",
		StudentId:     "201900001",
		CareerId:      "2",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"%s se desasignó del curso %s con éxito"}`,
		unassignment.StudentId,
		unassignment.CourseId,
	)
	r := gin.Default()
	r.POST("/courseUnassignment", src.CourseUnassignment)

	value, _ := json.Marshal(unassignment)
	req, _ := http.NewRequest("POST", "/courseUnassignment", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// Envío incorrecto de un parámetro
func TestErrorCourseUnassignment(t *testing.T) {
	unassignment := unassignment{
		CourseId:      "69",
		Semester:      "1S",
		CourseSection: "1",
		StudentId:     "201900001",
		CareerId:      "2",
	}

	mockResponse := `{"error":"La sección debe ser una letra","success":""}`
	r := gin.Default()
	r.POST("/courseUnassignment", src.CourseUnassignment)

	value, _ := json.Marshal(unassignment)
	req, _ := http.NewRequest("POST", "/courseUnassignment", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
