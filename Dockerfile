FROM golang:1.12

ENV GO111MODULE on

RUN go get -d -v github.com/minio/minio

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install -v -ldflags "-s -w" github.com/minio/minio

EXPOSE 9000

RUN groupadd -g 999 -r minio && useradd --no-log-init -u 999 -r -g minio minio

RUN mkdir /storage && chown -R minio:minio /storage

USER minio

CMD ["minio", "server", "/storage"]
