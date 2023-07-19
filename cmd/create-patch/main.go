package main

import (
	"fmt"
	"os"

	jsonpatch "github.com/evanphx/json-patch"
)

func main() {
	var (
		original []byte
		patch    []byte
		target   []byte
		err      error
	)

	args := os.Args[1:]

	if original, err = os.ReadFile(args[0]); err != nil {
		panic(err)
	}

	if target, err = os.ReadFile(args[1]); err != nil {
		panic(err)
	}

	if patch, err = jsonpatch.CreateMergePatch(original, target); err != nil {
		panic(err)
	}

	fmt.Printf("%s\n", patch)
}
