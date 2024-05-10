tail:
    bunx tailwindcss -i ./src/styles.css -o ./src/output.css --watch

start_database:
    surreal start memory -A --auth --user root --pass root
create_database:
    surreal import --conn http://localhost:8000 --user root --pass root --ns test --db test ./database/create.surql
database:create_database
    surreal import --conn http://localhost:8000 --user root --pass root --ns test --db test ./database/insert.surql

web:
    bun run dev

backend:
    node ./backend/server.js

backend2:
    go run ./backend2/server.go

