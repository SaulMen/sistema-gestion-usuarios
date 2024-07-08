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

type carrer struct {
	Name string `json:"name"`
}

func TestCreateCarrer(t *testing.T) {
	carrer := carrer{
		Name: "INGENIERIA EN CIENCIAS Y SISTEMAS",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":"Carrera %s creada"}`, carrer.Name)
	r := gin.Default()
	r.POST("/createCarreer", src.CreateCareer)

	value, _ := json.Marshal(carrer)
	req, _ := http.NewRequest("POST", "/createCarreer", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorCreateCareer(t *testing.T) {
	carrer := carrer{
		Name: "AREA COMUN",
	}
	mockResponse := `{"error":"El area comun se crea automaticamente","success":""}`
	r := gin.Default()
	r.POST("/createCarreer", src.CreateCareer)

	value, _ := json.Marshal(carrer)
	req, _ := http.NewRequest("POST", "/createCarreer", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
