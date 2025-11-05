package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from OpenShift! You requested: %s\n", r.URL.Path)
	log.Printf("Received request: %s %s", r.Method, r.URL.Path)
}

func main() {
	http.HandleFunc("/", handler)
	port := ":8080"
	log.Printf("Starting server on %s", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatalf("Server failed: %v", err)
	}
}
