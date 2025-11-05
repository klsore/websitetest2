# Stage 1: Build the Go app
FROM golang:1.18 AS builder

WORKDIR /app
COPY . .

RUN go mod init testapp || true
RUN go build -o myapp

# Stage 2: Minimal runtime image
FROM registry.access.redhat.com/ubi8/ubi-minimal

WORKDIR /app
COPY --from=builder /app/myapp .

EXPOSE 8080

CMD ["./myapp"]
