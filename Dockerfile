FROM golang:alpine
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
	GOPROXY="https://goproxy.cn,direct"
ENV APP_NAME goim

COPY . /app
WORKDIR /app
RUN go build -o  comet cmd/comet/main.go && \
    go build -o  logic cmd/logic/main.go  && \
    go build -o  job cmd/job/main.go

#COPY cmd/comet/comet-example.toml .
#COPY cmd/job/job-example.toml .
#COPY cmd/logic/logic-example.toml .

EXPOSE 8000
CMD ["/bin/sh"]
