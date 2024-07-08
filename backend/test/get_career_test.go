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

func TestGetCareer(t *testing.T) {

	r := gin.Default()
	r.GET("/getCareer", getdata.GetCareer)

	req, _ := http.NewRequest("GET", "/getCareer", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	var lista resp
	json.Unmarshal(w.Body.Bytes(), &lista)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.NotEmpty(t, lista.Success)
}
