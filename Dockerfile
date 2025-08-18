FROM golang:1.17-alpine

RUN apk --no-cache add git libc-dev gcc

RUN mkdir -p /go/src/github.com/gocraft/work
WORKDIR /go/src/github.com/gocraft/work

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go install -v ./cmd/...
