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

type teststudent struct {
	Id               string
	Name             string
	DateOfBirth      string
	Email            string
	PhoneNumber      string
	Address          string
	DPI              string
	Career           []string
	CompletedCredits string
}

type resStudent struct {
	Error   string      `json:"error"`
	Success teststudent `json:"success"`
}

func TestSuccessGetStudent(t *testing.T) {
	teststudent := teststudent{
		Id:               "202000011",
		Name:             "Estudiante Test",
		DateOfBirth:      "01-10-1999",
		Email:            "estudiante-test@correo.com",
		PhoneNumber:      "47920000",
		Address:          "Test 1 test 1",
		DPI:              "1234567890123",
		Career:           []string{"2 - INGENIERIA CIENCIAS Y SISTEMAS", "3 - INGENIERIA ELECTRONICA"},
		CompletedCredits: "30",
	}
	r := gin.Default()
	r.GET("/getStudent", getdata.GetStudent)

	req, _ := http.NewRequest("GET", "/getStudent", nil)
	q := req.URL.Query()
	q.Add("studentId", teststudent.Id)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res resStudent
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

func TestErrorGetStudent(t *testing.T) {
	teststudent := teststudent{
		Id:               "201900005",
		Name:             "Estudiante Test",
		DateOfBirth:      "01-10-1999",
		Email:            "estudiante-test@correo.com",
		PhoneNumber:      "47920000",
		Address:          "Test 1 test 1",
		DPI:              "1234567890123",
		Career:           []string{"2 - INGENIERIA CIENCIAS Y SISTEMAS", "3 - INGENIERIA ELECTRONICA"},
		CompletedCredits: "30",
	}
	r := gin.Default()
	r.GET("/getStudent", getdata.GetStudent)

	req, _ := http.NewRequest("GET", "/getStudent", nil)
	q := req.URL.Query()
	q.Add("studentId", teststudent.Id)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res resStudent
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusBadRequest, w.Code)
}
