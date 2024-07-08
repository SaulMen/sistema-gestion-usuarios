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

type testAssignment struct {
	CourseId string
	Semester string
	Year     string
	Section  string
}

func TestSuccessGetAssignments(t *testing.T) {
	testAssignment := testAssignment{CourseId: "101", Semester: "1S", Year: "2024", Section: "A"}
	r := gin.Default()
	r.GET("/getAssignments", getdata.GetAssignments)

	req, _ := http.NewRequest("GET", "/getAssignments", nil)
	q := req.URL.Query()
	q.Add("courseId", testAssignment.CourseId)
	q.Add("semester", testAssignment.Semester)
	q.Add("year", testAssignment.Year)
	q.Add("section", testAssignment.Section)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

// Petición válida pero no encuentra nada para retornar
func TestEmptyGetAssignments(t *testing.T) {
	testAssignment := testAssignment{CourseId: "101", Semester: "2S", Year: "2024", Section: "A"}
	r := gin.Default()
	r.GET("/getAssignments", getdata.GetAssignments)

	req, _ := http.NewRequest("GET", "/getAssignments", nil)
	q := req.URL.Query()
	q.Add("courseId", testAssignment.CourseId)
	q.Add("semester", testAssignment.Semester)
	q.Add("year", testAssignment.Year)
	q.Add("section", testAssignment.Section)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.Empty(t, res.Success)
}

func TestErrorGetAssignments(t *testing.T) {
	testAssignment := testAssignment{CourseId: "500", Semester: "1S", Year: "2024", Section: "A"}
	r := gin.Default()
	r.GET("/getAssignments", getdata.GetAssignments)

	req, _ := http.NewRequest("GET", "/getAssignments", nil)
	q := req.URL.Query()
	q.Add("courseId", testAssignment.CourseId)
	q.Add("semester", testAssignment.Semester)
	q.Add("year", testAssignment.Year)
	q.Add("section", testAssignment.Section)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusBadRequest, w.Code)
}
