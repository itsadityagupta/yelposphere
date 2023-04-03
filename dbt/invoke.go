package main
import (
        "fmt"
        "log"
        "net/http"
        "os"
        "os/exec"
)
func handler(w http.ResponseWriter, r *http.Request) {
        log.Print("helloworld: received a request")
cmd := exec.Command("/bin/sh", "script.sh")
        cmd.Stdout = os.Stdout
 cmd.Stderr = os.Stderr
 err := cmd.Run()
 if err != nil {
  log.Fatalf("cmd.Run() failed with %s\n", err)
 }
}

func main() {
        log.Print("helloworld: starting server...")
        http.HandleFunc("/", handler)
        port := os.Getenv("PORT")
        if port == "" {
                port = "8080"
        }

        // Create a new HTTP server with a timeout of 100 seconds
        srv := &http.Server{
                Addr:         fmt.Sprintf(":%s", port),
                Handler:      nil,
                ReadTimeout:  100 * time.Second,
                WriteTimeout: 100 * time.Second,
                IdleTimeout:  100 * time.Second,
        }

        log.Printf("helloworld: listening on %s", port)

        // Start the server and handle errors
        err := srv.ListenAndServe()
        if err != nil && err != http.ErrServerClosed {
                log.Fatalf("Server error: %s", err)
        }
}