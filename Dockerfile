
FROM golang:1.22.3-alpine AS builder

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main ./cmd/app

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]
