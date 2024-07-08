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

type prerequisite struct {
	CourseId       string `json:"course_id"`       // Curso principal
	PrerequisiteId string `json:"prerequisite_id"` // Curso prerrequisito
}

func TestSuccessAddCoursePrerequisite(t *testing.T) {
	prerequisite := prerequisite{
		CourseId:       "354",
		PrerequisiteId: "348",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"Se agregó el curso %s como prerrequisito para el curso  %s"}`,
		prerequisite.PrerequisiteId,
		prerequisite.CourseId,
	)
	r := gin.Default()
	r.POST("/addCoursePrerequisite", src.AddCoursePrerequisite)

	value, _ := json.Marshal(prerequisite)
	req, _ := http.NewRequest("POST", "/addCoursePrerequisite", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// Código de curso no existe en la base de datos
func TestErrorAddCoursePrerequisite(t *testing.T) {
	prerequisite := prerequisite{
		CourseId:       "500",
		PrerequisiteId: "348",
	}

	mockResponse := fmt.Sprintf(`{"error":"El codigo de curso \"%s\" no existe","success":""}`, prerequisite.CourseId)
	r := gin.Default()
	r.POST("/addCoursePrerequisite", src.AddCoursePrerequisite)

	value, _ := json.Marshal(prerequisite)
	req, _ := http.NewRequest("POST", "/addCoursePrerequisite", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
