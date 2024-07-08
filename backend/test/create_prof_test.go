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

type docente struct {
	Siif     string `json:"siif"`
	Name     string `json:"name"`
	Lastname string `json:"lastname"`
	Date     string `json:"date"`
	Email    string `json:"email"`
	Phone    string `json:"phone"`
	Direct   string `json:"direct"`
	Dpi      string `json:"dpi"`
	Passwrod string `json:"passwrod"`
}

func TestCreateDoc(t *testing.T) {
	mockResponse := `{"error":"","success":"El docente Juan ha sido registrado"}`
	r := gin.Default()
	r.POST("/createDoc", src.DocenteReg)

	students := docente{
		Siif:     "232",
		Name:     "Juan",
		Lastname: "Doe",
		Date:     "01-01-2000",
		Email:    "johndoe@example.com",
		Phone:    "12345678",
		Direct:   "123 Main St",
		Dpi:      "12345678",
		Passwrod: "secretpassword",
	}
	value, _ := json.Marshal(students)
	req, _ := http.NewRequest("POST", "/createDoc", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// El id ya está registrado en la base de datos
func TestErrorCreateDoc(t *testing.T) {
	mockResponse := `{"error":"El SIIF del docente ya existe","success":""}`
	r := gin.Default()
	r.POST("/createDoc", src.DocenteReg)

	students := docente{
		Siif:     "1",
		Name:     "Juan",
		Lastname: "Doe",
		Date:     "01-01-2000",
		Email:    "johndoe@example.com",
		Phone:    "12345678",
		Direct:   "123 Main St",
		Dpi:      "12345678",
		Passwrod: "secretpassword",
	}
	value, _ := json.Marshal(students)
	req, _ := http.NewRequest("POST", "/createDoc", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
