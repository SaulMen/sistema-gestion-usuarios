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

type std struct {
	Carnet string `json:"carnet"`
	Career string `json:"carrera"`
}

type courser struct {
	Code   int    `json:"codigo"`
	Name   string `json:"nombre"`
	Credit int    `json:"credito"`
	Note   int    `json:"nota"`
	Date   string `json:"fecha"`
}

type resp struct {
	Error   string    `json:"error"`
	Success []courser `json:"success"`
}

func TestCreateAppr(t *testing.T) {
	r := gin.Default()
	r.POST("/approvCourse", src.ApprovedCourse)

	carrer := std{
		Carnet: "202000012",
		Career: "2",
	}
	value, _ := json.Marshal(carrer)
	req, _ := http.NewRequest("POST", "/approvCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)
	var lista resp
	json.Unmarshal(w.Body.Bytes(), &lista)
	fmt.Println(lista)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, lista.Success)
}

// El carnet no existe en la base de datos, espera un error 400
func TestErrorCreateAppr(t *testing.T) {
	r := gin.Default()
	r.POST("/approvCourse", src.ApprovedCourse)

	carrer := std{
		Carnet: "201900005",
		Career: "2",
	}

	mockResponse := fmt.Sprintf(
		`{"error":"El carnet \"%s\" no existe","success":""}`,
		carrer.Carnet,
	)

	value, _ := json.Marshal(carrer)
	req, _ := http.NewRequest("POST", "/approvCourse", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusBadRequest, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
