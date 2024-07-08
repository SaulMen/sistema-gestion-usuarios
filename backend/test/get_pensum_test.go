package test

import (
	"encoding/json"
	"io/ioutil"
	getdata "main/src/get_data"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

type testCareer struct {
	CareerID string
}

func TestSuccessGetPensum(t *testing.T) {
	testCareer := testCareer{CareerID: "2"}
	r := gin.Default()
	r.GET("/getPensum", getdata.GetPensum)

	req, _ := http.NewRequest("GET", "/getPensum", nil)
	q := req.URL.Query()
	q.Add("careerId", testCareer.CareerID)
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var res res
	json.Unmarshal(w.Body.Bytes(), &res)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, res.Success)
}

// Tipo de dato incorrect, espera error 400
func TestErrorGetPensum(t *testing.T) {
	r := gin.Default()
	r.GET("/getPensum", getdata.GetPensum)

	req, _ := http.NewRequest("GET", "/getPensum", nil)
	q := req.URL.Query()
	q.Add("careerId", "A")
	req.URL.RawQuery = q.Encode()

	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	mockResponse := `{"error":"Error en el servidor","success":""}`

	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusBadRequest, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
