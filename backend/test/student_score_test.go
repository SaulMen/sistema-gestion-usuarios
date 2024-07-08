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

type student_score struct {
	CourseId      string `json:"course_id"`
	Semester      string `json:"semester"`
	CourseSection string `json:"course_section"`
	StudentId     string `json:"student_id"`
	Score         string `json:"score"` // Nota obtenida por el estudiante
	CareerId      string `json:"career_id"`
}

func TestSuccessScore(t *testing.T) {
	student_score := student_score{
		CourseId:      "101",
		Semester:      "1S",
		CourseSection: "Y",
		StudentId:     "202000049",
		Score:         "61",
		CareerId:      "5",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"Se ingresó la nota %s para el estudiante %s en el curso %s"}`,
		student_score.Score,
		student_score.StudentId,
		student_score.CourseId,
	)
	r := gin.Default()
	r.POST("/studentScore", src.Score)

	value, _ := json.Marshal(student_score)
	req, _ := http.NewRequest("POST", "/studentScore", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// Registro de estudiante no existe en la tabla de notas
func TestErrorScore(t *testing.T) {
	student_score := student_score{
		CourseId:      "69",
		Semester:      "1S",
		CourseSection: "B",
		StudentId:     "201900001",
		Score:         "61",
		CareerId:      "2",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"El estudiante \"%s\" no está asignado al curso \"%s\"","success":""}`,
		student_score.StudentId,
		student_score.CourseId,
	)
	r := gin.Default()
	r.POST("/studentScore", src.Score)

	value, _ := json.Marshal(student_score)
	req, _ := http.NewRequest("POST", "/studentScore", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
