package main

type User struct {
	Id       string `json:"id,omitempty"`
	Email    string `json:"email"`
	Username string `json:"username"`
	Password string `json:"password"`
}
