package main

import (
	"fmt"
	"io/ioutil"
)

type i interface {
	Do()
}

type c struct {
	a string
	b string
}

func x() error {
	var err error
	_ = err

	_ = c{}
	return nil
}

func main() {

	type s struct {
		a string
	}
	_ = s{"b"}
	_, err := ioutil.ReadFile("x.txt")
	if err != nil {
		return
	}

	fmt.Println("oh-yeah")

}
