package test

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	getdata "main/src/get_data"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type data struct {
	Carnet string `json:"carnet"`
	Ciclo  string `json:"ciclo"`
	Anio   string `json:"anio"`
}

func TestSdudentC(t *testing.T) {
	std := data{
		Carnet: "202000011",
		Ciclo:  "1S",
		Anio:   "2024",
	}
	r := gin.Default()
	r.POST("/studentCourse", getdata.StudentCourses)

	value, _ := json.Marshal(std)
	req, _ := http.NewRequest("POST", "/studentCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res resp
	json.Unmarshal(w.Body.Bytes(), &res)

	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

func TestErrorSdudentC(t *testing.T) {
	std := data{
		Carnet: "",
		Ciclo:  "11",
		Anio:   "2024",
	}
	r := gin.Default()
	r.POST("/studentCourse", getdata.StudentCourses)

	value, _ := json.Marshal(std)
	req, _ := http.NewRequest("POST", "/studentCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	mockResponse := `{"error":"Error en el servidor","success":""}`
	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
