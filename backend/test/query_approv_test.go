package test

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"main/src"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type aprov struct {
	Codigo  string `json:"codigo"`
	Ciclo   string `json:"ciclo"`
	Anio    string `json:"anio"`
	Section string `json:"seccion"`
}

func TestQueryAppr(t *testing.T) {
	aprobado := aprov{
		Codigo:  "101",
		Ciclo:   "1S",
		Anio:    "2024",
		Section: "A",
	}
	r := gin.Default()
	r.POST("/queryApr", src.QueryApprov)

	value, _ := json.Marshal(aprobado)
	req, _ := http.NewRequest("POST", "/queryApr", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var lista resp
	json.Unmarshal(w.Body.Bytes(), &lista)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, lista.Success)
}

func TestErrorQueryAppr(t *testing.T) {
	aprobado := aprov{
		Codigo:  "400",
		Ciclo:   "1S",
		Anio:    "2024",
		Section: "A",
	}
	r := gin.Default()
	r.POST("/queryApr", src.QueryApprov)

	value, _ := json.Marshal(aprobado)
	req, _ := http.NewRequest("POST", "/queryApr", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	mockResponse := `{"error":"Error en el servidor","success":""}`
	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusBadRequest, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
