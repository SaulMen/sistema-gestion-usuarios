package test

import (
	"encoding/json"
	getdata "main/src/get_data"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type testProfessor struct {
	Id          string `json:"id"`
	Name        string `json:"fullname"`
	DateOfBirth string `json:"date_birth"`
	Email       string `json:"email"`
	PhoneNumber string `json:"phone_number"`
	Address     string `json:"address"`
	DPI         string `json:"dpi"`
}

type resProfessor struct {
	Error   string        `json:"error"`
	Success testProfessor `json:"success"`
}

func TestSuccessGetProfessor(t *testing.T) {
	testProfessor := testProfessor{
		Id:          "1",
		Name:        "Docente Test",
		DateOfBirth: "01-10-1999",
		Email:       "docente-test@correo.com",
		PhoneNumber: "47920000",
		Address:     "Test 1 test 1",
		DPI:         "1234567890123",
	}
	r := gin.Default()
	r.GET("/getProfessor", getdata.GetProfessor)

	req, _ := http.NewRequest("GET", "/getProfessor", nil)
	q := req.URL.Query()
	q.Add("professorId", testProfessor.Id)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res resProfessor
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

func TestErrorGetProfessor(t *testing.T) {
	testProfessor := testProfessor{
		Id:          "500",
		Name:        "Docente Test",
		DateOfBirth: "01-10-1999",
		Email:       "docente-test@correo.com",
		PhoneNumber: "47920000",
		Address:     "Test 1 test 1",
		DPI:         "1234567890123",
	}
	r := gin.Default()
	r.GET("/getProfessor", getdata.GetProfessor)

	req, _ := http.NewRequest("GET", "/getProfessor", nil)
	q := req.URL.Query()
	q.Add("professorId", testProfessor.Id)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res resProfessor
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusBadRequest, w.Code)
}
