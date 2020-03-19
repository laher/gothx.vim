package main

import (
	"fmt"
	"io/ioutil"
)

func main() {

	type s struct {
		a string
	}
	_ = s{"b"}
	ioutil.ReadFile("x.txt")

	fmt.Println("oh-yeah")

}
