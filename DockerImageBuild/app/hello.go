package main

import (
  "fmt"
  "log"
  "net/http"
  "github.com/gorilla/mux"
)

func main() {
  router := mux.NewRouter()
  router.HandleFunc("/", DoHealthCheck).Methods("GET")
  log.Fatal(http.ListenAndServe(":80", router))
}

func DoHealthCheck(w http.ResponseWriter, r *http.Request) {
   fmt.Fprintf(w, "Hello world v6!")
   w.WriteHeader(http.StatusAccepted) //RETURN HTTP CODE 202
}
