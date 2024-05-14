package main

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"github.com/surrealdb/surrealdb.go"
	"log"
	"net/http"
	"os"
)

var db, err = surrealdb.New("ws://localhost:8000/rpc")
var mldata [][]string

func CORS(next http.Handler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Add("Access-Control-Allow-Origin", "*")
		w.Header().Add("Access-Control-Allow-Credentials", "true")
		w.Header().Add("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		w.Header().Add("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		if r.Method == "OPTIONS" {
			http.Error(w, "No Content", http.StatusNoContent)
			return
		}
		next.ServeHTTP(w, r)
	}
}

func adduser(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(os.Stdout, "== %s!", r.Body)
	fmt.Fprintf(w, "== %s!", r.Body)
	w.WriteHeader(http.StatusOK)
}
func readfile(a *[][]string) {
	// Open the CSV file
	file, err := os.Open("InflationIndicator_pro.csv")
	if err != nil {
		fmt.Println("Error opening file:", err)
		return
	}
	defer file.Close() // Close the file after reading
	// Create a CSV reader
	reader := csv.NewReader(file)

	// Read all records from the CSV file
	records, err := reader.ReadAll()
	if err != nil {
		fmt.Println("Error reading records:", err)
		return
	}
	a = &records
}
func main() {
	if err != nil {
		panic(err)
	}

	if _, err = db.Signin(map[string]interface{}{
		"user": "root",
		"pass": "root",
	}); err != nil {
		panic(err)
	}

	if _, err = db.Use("test", "test"); err != nil {
		panic(err)
	}

	// // Create user
	user := User{
		Username: "sad",
		Password: "sad",
		Email:    "sad",
	}

	// // Insert user
	data, err := db.Create("user", user)
	if err != nil {
		panic(err)
	}

	// // Unmarshal data
	createdUser := make([]User, 1)
	err = surrealdb.Unmarshal(data, &createdUser)
	if err != nil {
		panic(err)
	}

	fmt.Fprint(os.Stdout, []any{"%s! \n", createdUser}...)

	// // Get user by ID
	data, err = db.Select(createdUser[0].Id)
	if err != nil {
		panic(err)
	}

	// // Unmarshal data
	selectedUser := new(User)
	err = surrealdb.Unmarshal(data, &selectedUser)
	if err != nil {
		panic(err)
	}

	fmt.Fprint(os.Stdout, []any{"%s! \n", selectedUser}...)

	// // Change part/parts of user
	// changes := map[string]string{"name": "Jane"}
	// if _, err = db.Change(selectedUser.Id, changes); err != nil {
	// 	panic(err)
	// }

	// // Update user
	// if _, err = db.Update(selectedUser.ID, changes); err != nil {
	// 	panic(err)
	// }

	if _, err = db.Query("SELECT * FROM $record", map[string]interface{}{
		"record": createdUser[0].Id,
	}); err != nil {
		panic(err)
	}

	// // Delete user by ID
	// if _, err = db.Delete(selectedUser.ID); err != nil {
	// 	panic(err)
	// }
	router := http.NewServeMux()
	server := http.Server{
		Addr:    ":8080",
		Handler: CORS(router),
	}
	router.HandleFunc("POST /api/register", adduser)
	log.Fatal(server.ListenAndServe())
}
