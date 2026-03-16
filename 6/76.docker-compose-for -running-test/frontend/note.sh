rather than running a single docker compose file a single container for th both app.js & app test.js
we can run both in a single file

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - '3002:3000'
    volumes:
      - /app/node_modules
      - .:/app

  tests:
    stdin_open: true
    build: 
      context: .
      dockerfile: Dockerfile.dev
    volumes:
      - /app/node_modules
      - .:/app
    command: ["npm", "run", "test"]  