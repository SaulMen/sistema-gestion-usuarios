package src

import (
	"fmt"
	"main/connection"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type course struct {
	Id               string `json:"id"`
	Name             string `json:"name"`
	RequiredCredits  string `json:"required_credits"`
	CompletedCredits string `json:"completed_credits"`
	Career           string `json:"careers"`
	IsMandatory      string `json:"is_mandatory"`
}

func CreateCourse(c *gin.Context) {
	var course course
	c.BindJSON(&course)

	_, err := connection.DB.Exec(fmt.Sprintf("call crearCurso(%s,'%s',%s,%s,%s)",
		course.Id,
		course.Name,
		course.RequiredCredits,
		course.CompletedCredits,
		course.IsMandatory,
	))

	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	carrer := strings.Split(course.Career, ",")
	for _, value := range carrer {
		connection.DB.Exec(fmt.Sprintf("call perteneceCurso(%s,%s);", course.Id, value))
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": fmt.Sprintf("El curso %s ha sido creado exitosamente", course.Id),
	})
}
