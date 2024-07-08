package src

import (
	"fmt"
	"main/connection"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

type std struct {
	Carnet string `json:"carnet"`
	Career string `json:"carrera"`
}

type courser struct {
	Code   int    `json:"codigo"`
	Name   string `json:"nombre"`
	Credit int    `json:"credito"`
	Note   int    `json:"nota"`
	Date   string `json:"fecha"`
}

func ApprovedCourse(c *gin.Context) {
	var student std
	c.BindJSON(&student)
	rows, e := connection.DB.Query(fmt.Sprintf("select * from cursosAprobados(%s,%s);",
		student.Carnet,
		student.Career))
	if e != nil {
		c.JSON(400, gin.H{
			"error":   e.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	defer rows.Close()
	var listCourse []courser
	var course courser
	for rows.Next() {
		rows.Scan(&course.Code, &course.Name, &course.Credit, &course.Note, &course.Date)
		listCourse = append(listCourse, course)
	}

	c.JSON(200, gin.H{
		"error":   "",
		"success": listCourse,
	})
}
