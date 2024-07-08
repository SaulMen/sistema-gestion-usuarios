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

type testStudent struct {
	StudentId string
	CareerId  string
}

type res struct {
	Error   string   `json:"error"`
	Success []string `json:"success"`
}

func TestSuccessApprovedCourses(t *testing.T) {
	testStudent := testStudent{StudentId: "202000011", CareerId: "2"}
	r := gin.Default()
	r.GET(`/getApprovedCourses`, getdata.GetApprovedCourses)

	req, _ := http.NewRequest("GET", "/getApprovedCourses", nil)
	q := req.URL.Query()
	q.Add("studentId", testStudent.StudentId)
	q.Add("careerId", testStudent.CareerId)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

// Petición válida pero no encuentra nada para retornar
func TestEmptyApprovedCourses(t *testing.T) {
	testStudent := testStudent{StudentId: "201900001", CareerId: "2"}
	r := gin.Default()
	r.GET(`/getApprovedCourses`, getdata.GetApprovedCourses)

	req, _ := http.NewRequest("GET", "/getApprovedCourses", nil)
	q := req.URL.Query()
	q.Add("studentId", testStudent.StudentId)
	q.Add("careerId", testStudent.CareerId)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.Empty(t, res.Success)
}

func TestErrorApprovedCourses(t *testing.T) {
	testStudent := testStudent{StudentId: "201900002", CareerId: "2"}
	r := gin.Default()
	r.GET(`/getApprovedCourses`, getdata.GetApprovedCourses)

	req, _ := http.NewRequest("GET", "/getApprovedCourses", nil)
	q := req.URL.Query()
	q.Add("studentId", testStudent.StudentId)
	q.Add("careerId", testStudent.CareerId)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusBadRequest, w.Code)
}
