package src

import (
	"fmt"
	"io"
	"main/connection"
	"path"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/lib/pq"
)

func Uploadfile(c *gin.Context) {
	file, err := c.FormFile("archivo")
	if err != nil {
		c.JSON(200, gin.H{
			"error":   "Algo sucedio mal",
			"success": "",
		})
		return
	}
	if path.Ext(file.Filename) != ".csv" {
		c.JSON(200, gin.H{
			"error":   "Debe subir archivos csv",
			"success": "",
		})
		return
	}
	f, _ := file.Open()
	temp, err := io.ReadAll(f)
	if err != nil {
		c.JSON(200, gin.H{
			"error":   err.Error(),
			"success": "",
		})
		return
	}
	defer f.Close()
	var val int
	if err := connection.DB.QueryRow("select count(*) from horario;").Scan(&val); err != nil {
		c.JSON(200, gin.H{
			"error":   err.(*pq.Error).Message,
			"success": "",
		})
		return
	}
	if val > 0 {
		connection.DB.Exec("drop table horario;")
		connection.DB.Exec(`
		CREATE TABLE Horario (
			id_horario                   SERIAL PRIMARY KEY,
			nombre                       VARCHAR(50) NOT NULL,
			id_habilitado                INT NOT NULL,
			siif                         INT NOT NULL,
			nombre_aux                   VARCHAR(50),
			ubicacion                    VARCHAR(50),
			dia                          INT NOT NULL,
			hora                         VARCHAR(20) NOT NULL,
			FOREIGN KEY (id_habilitado)  REFERENCES HabilitarCurso(id_habilitado),
			FOREIGN KEY (siif) REFERENCES Docente(siif),
			FOREIGN KEY (nombre) REFERENCES Curso(nombre		);`)
	}
	ne := strings.Split(strings.Trim(string(temp), "\n"), "\n")
	var lista []string
	for _, val := range ne {
		lista = strings.Split(val, ",")
		if len(lista) != 7 {
			c.JSON(200, gin.H{
				"error":   "Formato de csv incorrecto",
				"success": "",
			})
			return
		}
		_, err := connection.DB.Exec(fmt.Sprintf("call agregarHorario('%s',%s,%s,'%s','%s',%s,'%s')",
			lista[0],
			lista[1],
			lista[2],
			lista[3],
			lista[4],
			lista[5],
			strings.TrimRight(lista[6], " ")))
		if err != nil {
			c.JSON(200, gin.H{
				"error":   err.(*pq.Error).Message,
				"success": "",
			})
			return
		}
	}
	c.JSON(200, gin.H{
		"error":   "",
		"success": "Archivo cargado con exito",
	})

}
