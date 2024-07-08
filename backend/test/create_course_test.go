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

type course struct {
	Id               string `json:"id"`
	Name             string `json:"name"`
	RequiredCredits  string `json:"required_credits"`
	CompletedCredits string `json:"completed_credits"`
	Career           string `json:"careers"`
	IsMandatory      string `json:"is_mandatory"`
}

func TestSuccessCreateCourse(t *testing.T) {
	course := course{
		Id:               "900",
		Name:             "CURSO EXTRACURRICULAR",
		RequiredCredits:  "0",
		CompletedCredits: "1",
		Career:           "2",
		IsMandatory:      "false",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":"El curso %s ha sido creado exitosamente"}`, course.Id)
	r := gin.Default()
	r.POST("/createCourse", src.CreateCourse)

	value, _ := json.Marshal(course)
	req, _ := http.NewRequest("POST", "/createCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorCreateCourse(t *testing.T) {
	course := course{
		Id:               "900",
		Name:             "CURSO EXTRACURRICULAR",
		RequiredCredits:  "0",
		CompletedCredits: "1",
		Career:           "2",
		IsMandatory:      "false",
	}

	mockResponse := fmt.Sprintf(`{"error":"El codigo de curso \"%s\" ya existe","success":""}`, course.Id)
	r := gin.Default()
	r.POST("/createCourse", src.CreateCourse)

	value, _ := json.Marshal(course)
	req, _ := http.NewRequest("POST", "/createCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
