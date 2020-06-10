package main

import (
	"fmt"
	"log"
	"os"

	"moul.io/motd"
)

func main() {
	if err := run(os.Args); err != nil {
		log.Fatalf("error: %v!", err)
		os.Exit(1)
	}
}

func run(_ []string) error {
	fmt.Print(motd.Default())
	return nil
}