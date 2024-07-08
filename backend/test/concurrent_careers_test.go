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

type concurrent_career struct {
	StudentId string `json:"student_id"`
	CareerId  string `json:"career_id"`
}

func TestSuccessAssignConcurrentCareer(t *testing.T) {
	concurrent_career := concurrent_career{
		StudentId: "202000012",
		CareerId:  "3",
	}
	mockResponse := fmt.Sprintf(
		`{"error":"","success":"Se inscribió a %s en la carrera %s"}`,
		concurrent_career.StudentId,
		concurrent_career.CareerId,
	)
	r := gin.Default()
	r.POST("/assignConcurrentCareer", src.AssignConcurrentCareer)

	value, _ := json.Marshal(concurrent_career)
	req, _ := http.NewRequest("POST", "/assignConcurrentCareer", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}

// El carnet enviado no existe en la base de datos
func TestErrorAssignConcurrentCareer(t *testing.T) {
	concurrent_career := concurrent_career{
		StudentId: "201900000",
		CareerId:  "3",
	}
	mockResponse := `{"error":"El numero de carnet no existe","success":""}`

	r := gin.Default()
	r.POST("/assignConcurrentCareer", src.AssignConcurrentCareer)

	value, _ := json.Marshal(concurrent_career)
	req, _ := http.NewRequest("POST", "/assignConcurrentCareer", bytes.NewBuffer(value))
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, mockResponse, string(responseData))
	assert.Equal(t, http.StatusOK, w.Code)
}
