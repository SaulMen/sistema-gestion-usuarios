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

type login struct {
	User     string `json:"user"`
	Password string `json:"password"`
	Rol      string `json:"rol"`
}

func TestSuccessLoginStudent(t *testing.T) {
	acta := login{
		User:     "202000011",
		Password: "pass1",
		Rol:      "0",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":%t}`, true)
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorLoginStudent(t *testing.T) {
	acta := login{
		User:     "202000011",
		Password: "pass",
		Rol:      "0",
	}
	mockResponse := `{"error":"Credenciales de estudiante incorrectas","success":""}`
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestSuccessLoginAdmin(t *testing.T) {
	acta := login{
		User:     "admin",
		Password: "admin",
		Rol:      "2",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":%t}`, true)
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorLoginAdmin(t *testing.T) {
	acta := login{
		User:     "admin",
		Password: "1234",
		Rol:      "2",
	}
	mockResponse := `{"error":"No existe usuario admin","success":""}`
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestSuccessLoginProfessor(t *testing.T) {
	acta := login{
		User:     "1",
		Password: "pass1",
		Rol:      "1",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":%t}`, true)
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

func TestErrorLoginProfessor(t *testing.T) {
	acta := login{
		User:     "1",
		Password: "pass",
		Rol:      "1",
	}
	mockResponse := `{"error":"Credenciales de docente incorrectas","success":""}`
	r := gin.Default()
	r.POST("/login", src.Login)

	value, _ := json.Marshal(acta)
	req, _ := http.NewRequest("POST", "/login", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := io.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
