FROM golang:alpine as build_go_env
RUN mkdir -p /go/src/gitlab.fasibio.de/pwd/pwdAuth/service && mkdir -p /src/bin &&  apk update && apk add git
ADD . /go/src/github.fasibio.de/ci-env2file-docker
RUN cd /go/src/github.fasibio.de/ci-env2file-docker && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /src/bin/env2file main.go

FROM alpine:3.9
COPY --from=build_go_env /src/bin/env2file /bin



