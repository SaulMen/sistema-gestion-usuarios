package test

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"main/src"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type acta struct {
	Codigo  string `json:"codigo"`
	Section string `json:"section"`
	Ciclo   string `json:"ciclo"`
}

func TestGenActa(t *testing.T) {
	acta := acta{
		Codigo:  "101",
		Section: "Y",
		Ciclo:   "1S",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":"Se generó correctamente el acta del curso '%s'"}`, acta.Codigo)
	r := gin.Default()
	r.POST("/genActa", src.GenerateAct)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/genActa", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorGenActa(t *testing.T) {
	acta := acta{
		Codigo:  "101",
		Section: "Y",
		Ciclo:   "1S",
	}
	mockResponse := `{"error":"Ya existe un acta para dicho curso, no se puede modificar","success":""}`
	r := gin.Default()
	r.POST("/genActa", src.GenerateAct)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/genActa", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
