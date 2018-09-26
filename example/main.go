package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	str := fmt.Sprintf("Handling: /%s\n", r.URL.Path[1:])

	fmt.Print(str)
	fmt.Fprint(w, str)
}

func main() {
	addr := ":443"
	fmt.Println("Starting HTTPS server on ", addr)

	http.HandleFunc("/", handler)
	http.ListenAndServeTLS(addr, certFile, keyFile, nil)
}
