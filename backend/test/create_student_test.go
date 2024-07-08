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

type student struct {
	Carnet    string `json:"carnet"`
	Names     string `json:"names"`
	Lastname  string `json:"lastname"`
	Date      string `json:"date"`
	Email     string `json:"email"`
	Phone     string `json:"phone"`
	Direction string `json:"direccion"`
	Dpi       string `json:"dpi"`
	Carrer    string `json:"career"`
	Password  string `json:"password"`
}

func TestCreate(t *testing.T) {
	students := student{
		Carnet:    "20240009",
		Names:     "John",
		Lastname:  "Doe",
		Date:      "01-01-2000",
		Email:     "johndoe@example.com",
		Phone:     "12345678",
		Direction: "123 Main St",
		Dpi:       "12345678",
		Carrer:    "2",
		Password:  "secretpassword",
	}
	mockResponse := fmt.Sprintf(`{"error":"","success":"El estudiante %s ha sido registrado"}`, students.Carnet)
	r := gin.Default()
	r.POST("/createStudent", src.StudentReg)

	value, _ := json.Marshal(students)
	req, _ := http.NewRequest("POST", "/createStudent", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// El carnet ya existe en la base de datos, espera un 400
func TestErrorCreate(t *testing.T) {
	students := student{
		Carnet:    "20240009",
		Names:     "John",
		Lastname:  "Doe",
		Date:      "01-01-2000",
		Email:     "johndoe@example.com",
		Phone:     "12345678",
		Direction: "123 Main St",
		Dpi:       "12345678",
		Carrer:    "2",
		Password:  "secretpassword",
	}
	mockResponse := `{"error":"El numero de carnet ya existe","success":""}`
	r := gin.Default()
	r.POST("/createStudent", src.StudentReg)

	value, _ := json.Marshal(students)
	req, _ := http.NewRequest("POST", "/createStudent", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusBadRequest, w.Code)
}
