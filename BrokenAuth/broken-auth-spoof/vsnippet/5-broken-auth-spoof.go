package main

/*
* YesWeHack - Vulnerable code snippets
*/

import (
	"fmt"
	"net"
	"net/http"
	"os"
	"strings"
)

type Headers struct {
	ClientIP string
	Role     *http.Cookie
}

func main() {
	http.HandleFunc("/",
		func(w http.ResponseWriter, r *http.Request) {
			fmt.Fprintln(w, "To access as admin you need to have a role as \"admin\" and be on the localhost system.")
		})

	http.HandleFunc("/admin",
		func(w http.ResponseWriter, r *http.Request) {
			// Client checks:
		h := &Headers{}
		roleCookie, err := r.Cookie("role")
		if err != nil || roleCookie.Value == "" {
			http.Error(w, "Missing or invalid role cookie", http.StatusBadRequest)
			return
		}
		h.Role = roleCookie

		h.ClientIP = r.Header.Get("X-Forwarded-For")
		if h.ClientIP == "" || !isValidIP(h.ClientIP) {
			http.Error(w, "Missing or invalid X-Forwarded-For header", http.StatusBadRequest)
			return
		}

		// Render HTML
		fmt.Fprintln(w, html())

		if strings.ToLower(h.Role.Value) == "admin" {
			allowedHosts := strings.Split(os.Getenv("ALLOWED_HOSTS"), ",")
			for _, host := range allowedHosts {
				if host == strings.Split(h.ClientIP, ":")[0] {
					fmt.Fprintln(w, html_AdminDashboard())
					return
				}
			}
			http.Error(w, "Access denied: Unauthorized host", http.StatusForbidden)
		}
	})
	// Start web server
	run()
}

func html() string {
	return "<p>Welcome we verify that you're an administrator, wait...</p>"
}

func html_AdminDashboard() string {
	return "<h1>Logging in...</h1>"
	// Loading Admin dashboard content...
	// Code..
}

func run() {
	port := 1337
	addr := fmt.Sprintf("0.0.0.0:%d", port)
	fmt.Printf("Server listening on : http://%s\n", addr)
	http.ListenAndServe(addr, nil)
}

func isValidIP(ip string) bool {
	// Enhanced validation for IP format
	parsedIP := net.ParseIP(ip)
	return parsedIP != nil
}