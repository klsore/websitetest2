FROM golang:1.20-alpine AS build

WORKDIR /app
COPY . .

RUN go mod init app || true
RUN go build -o app .

FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/app .
EXPOSE 8080
CMD ["./app"]
