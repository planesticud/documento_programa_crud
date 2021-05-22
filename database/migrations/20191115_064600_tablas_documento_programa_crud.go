package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type TablasDocumentoProgramaCrud_20191115_064600 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &TablasDocumentoProgramaCrud_20191115_064600{}
	m.Created = "20191115_064600"

	migration.Register("TablasDocumentoProgramaCrud_20191115_064600", m)
}

// Run the migrations
func (m *TablasDocumentoProgramaCrud_20191115_064600) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/20191115_064600_tablas_documento_programa_crud.up.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}

}

// Reverse the migrations
func (m *TablasDocumentoProgramaCrud_20191115_064600) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/20191115_064600_tablas_documento_programa_crud.down.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}

}
