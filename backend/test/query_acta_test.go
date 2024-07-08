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

type codigoc struct {
	Codigo string `json:"codigo"`
}

func TestGenQuery(t *testing.T) {
	codigo := codigoc{
		Codigo: "101",
	}
	r := gin.Default()
	r.POST("/queryActa", src.QueryActa)

	value, _ := json.Marshal(codigo)
	req, _ := http.NewRequest("POST", "/queryActa", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var lista resp
	json.Unmarshal(w.Body.Bytes(), &lista)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, lista.Success)
}

// El código del curso no existe, espera un error 400
func TestErrorGenQuery(t *testing.T) {
	codigo := codigoc{
		Codigo: "400",
	}
	r := gin.Default()
	r.POST("/queryActa", src.QueryActa)

	value, _ := json.Marshal(codigo)
	req, _ := http.NewRequest("POST", "/queryActa", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	mockResponse := `{"error":"Error en el servidor","success":""}`
	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusBadRequest, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
