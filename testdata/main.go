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
	ioutil.ReadFile("x.txt")

	fmt.Println("oh-yeah")

}
