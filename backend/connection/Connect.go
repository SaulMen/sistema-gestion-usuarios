package connection

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

func connect() *sql.DB {
	var conf string = "user=postgres port=5432 dbname=postgres password=1234 sslmode=disable host=mydatabase"
	db, err := sql.Open("postgres", conf)
	if err != nil {
		fmt.Println(err)

	}
	return db
}

var DB *sql.DB = connect()
