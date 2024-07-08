package main

import (
	"main/src"
	getdata "main/src/get_data"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.POST("/createCarreer", src.CreateCareer)
	r.POST("/createDoc", src.DocenteReg)
	r.POST("/createStudent", src.StudentReg)
	r.POST("/createCourse", src.CreateCourse)
	r.POST("/addCourse", src.AddCourse)
	r.POST("/addCoursePrerequisite", src.AddCoursePrerequisite)
	r.POST("/assignConcurrentCareer", src.AssignConcurrentCareer)
	r.POST("/uploadfile", src.Uploadfile)
	r.POST("/courseAssignment", src.CourseAssignment)
	r.POST("/courseUnassignment", src.CourseUnassignment)
	r.POST("/studentScore", src.Score)
	r.POST("/approvCourse", src.ApprovedCourse)
	r.POST("/genActa", src.GenerateAct)
	r.POST("/queryActa", src.QueryActa)
	r.POST("/queryApr", src.QueryApprov)
	r.POST("/login", src.Login)
	r.POST("/studentCourse", getdata.StudentCourses)

	r.GET("/getCareer", getdata.GetCareer)
	r.GET("/getCourse", getdata.GetCouse)
	r.GET("/getApprovedCourses", getdata.GetApprovedCourses)
	r.GET("/getPensum", getdata.GetPensum)
	r.GET("/getStudent", getdata.GetStudent)
	r.GET("/getProfessor", getdata.GetProfessor)
	r.GET("/getAssignments", getdata.GetAssignments)
	r.Run()
}
