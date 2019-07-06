FROM golang:1.12 as builder

ENV GO111MODULE on

RUN go get -d -v github.com/minio/minio

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install -v -ldflags "-s -w" github.com/minio/minio

EXPOSE 9000

CMD ["minio"]
