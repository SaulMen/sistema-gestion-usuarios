package test

import (
	"io/ioutil"
	"main/src"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func TestUploadfile(t *testing.T) {
	r := gin.Default()
	r.POST("/uploadfile", src.Uploadfile)

	req, _ := http.NewRequest("POST", "/uploadfile", nil)
	w := httptest.NewRecorder()
	r.ServeHTTP(w, req)

	mockResponse := `{"error":"Algo sucedio mal","success":""}`
	responseData, _ := ioutil.ReadAll(w.Body)
	assert.Equal(t, http.StatusOK, w.Code)
	assert.Equal(t, mockResponse, string(responseData))
}
