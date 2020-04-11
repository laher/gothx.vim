package main

import (
	"fmt"
	"io/ioutil"
)

type i interface {
	Do()
}

type c struct {
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
