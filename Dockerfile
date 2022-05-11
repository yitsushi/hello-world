FROM golang:1.18-alpine3.15 as builder

COPY . /code

RUN apk add -U git \
  && cd /code \
  && go build -ldflags="-buildid=$(git describe --tags)" -o /server . \
  && chmod +x /server

FROM alpine:3.15

LABEL maintainer="Balazs Nadasdi <balazs@weave.works>"

ENV LISTEN=":9999"

COPY --from=builder /server /server

ENTRYPOINT [ "/server" ]
