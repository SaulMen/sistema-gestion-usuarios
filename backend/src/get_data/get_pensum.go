package getdata

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
)

type course struct {
	Id               string `json:"id"`
	Name             string `json:"name"`
	CompletedCredits string `json:"completed_credits"`
	RequiredCredits  string `json:"required_credits"`
	IsMandatory      string `json:"is_mandatory"`
}

func GetPensum(c *gin.Context) {
	careerId := c.Query("careerId")
	rows, err := connection.DB.Query(fmt.Sprintf("SELECT * FROM consultaPensum(%s)", careerId))
	if err != nil {
		c.JSON(400, gin.H{
			"error":   "Error en el servidor",
			"success": "",
		})
		return
	}
	defer rows.Close()

	var courses []course
	var course course
	for rows.Next() {
		rows.Scan(
			&course.Id,
			&course.Name,
			&course.CompletedCredits,
			&course.RequiredCredits,
			&course.IsMandatory,
		)
		courses = append(courses, course)
	}

	if courses == nil {
		c.JSON(200, gin.H{
			"error":   "",
			"success": []string{},
		})
		return
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": courses,
	})
}
