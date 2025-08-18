FROM golang:1.24.3 AS build-stage

WORKDIR /build

RUN apt-get install make

COPY . .

RUN go mod tidy
RUN make build

FROM alpine:latest
RUN --mount=type=cache,target="/go/caches/go-build" apk update && apk add ca-certificates curl bash

WORKDIR /

COPY --from=build-stage /build/only-office-service-api /only-office-service-api
COPY . .

EXPOSE 3000

ENTRYPOINT ["/only-office-service-api"]
