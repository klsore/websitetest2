# Use Go 1.24
FROM golang:1.24-alpine AS build

WORKDIR /app
COPY . .

# Ensure module exists
RUN go mod tidy

# Build binary
RUN go build -o app .

# Minimal runtime
FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/app .
CMD ["./app"]
