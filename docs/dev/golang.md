# Golang

Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.


- - -


## Links

- [Main website](https://golang.org/)
- [Wikipedia](https://en.wikipedia.org/wiki/Go_(programming_language))


- - -


## Table of Content

- [Decision Patterns](#decision-patterns)
- [Useful Packages](#useful-packages)
- [Useful Scripts](#useful-scripts)
- [Useful Tools](#useful-tools)
- [An Optimised Dockerfile](#an-optimised-dockerfile)
- [Community Events](#community-events)


- - -


## Decision Patterns

- First class functions
- Support for native classes
- Lean keyword set
- Support for OOP
- Tuple returns
- Strongly typed language
- Type inference
- Compiled binaries


- - -


## Useful Packages

| Name | Category | URL |
| --- | --- | --- |
| Cobra | CLI framework | [https://github.com/spf13/cobra](https://github.com/spf13/cobra) |
| Gorilla Mux | HTTP request multiplexer | [https://github.com/gorilla/mux](https://github.com/gorilla/mux) |
| Logrus | Logging | [https://github.com/sirupsen/logrus](https://github.com/sirupsen/logrus) |
| UUID | Unique ID generator | [https://github.com/google/uuid](https://github.com/google/uuid) |
| Testify | Testing framework | [https://github.com/stretchr/testify](https://github.com/stretchr/testify) |
| Viper | Configuration management | [https://github.com/spf13/viper](https://github.com/spf13/viper) |


- - -


## Useful Scripts

### Dependency Installation

```sh
go mod vendor -v
```

### Dependency Updating

```sh
go mod tidy -v
```

### Running Commands

```sh
go run ./cmd/_;
```

### Running Tests

```sh
go test -cover -coverprofile c.out ./...;
```

### Static Build

```sh
CGO_ENABLED=0 go build -a -ldflags "-extldflags 'static'" ./cmd/_
```

### Strip Symbols/Debugging Information

```sh
CGO_ENABLED=0 go build -ldflags "-s -w" ./cmd/_
```


- - -


## Useful Tools

| Name | Description | Link |
| --- | --- | --- | 
| Go | Rich Go language support for Visual Studio Code | [https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go) |


- - -


## An Optimised Dockerfile

The following assumes that the script `make bin` will create a primary binary at `./bin/app`

```dockerfile
FROM golang:1.13-alpine3.10 AS base
ARG BIN_NAME="app"
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN apk add --no-cache make upx ca-certificates
WORKDIR /build
COPY . /build
RUN make bin
RUN upx /build/bin/${BIN_NAME} -o /build/bin/${BIN_NAME}_upxed

FROM scratch AS final
ARG BIN_NAME="app"
COPY --from=base /usr/share/ca-certificates /usr/share/ca-certificates
COPY --from=base /etc/passwd /etc/passwd
COPY --from=base /build/bin/${BIN_NAME}_upxed /app
ENTRYPOINT ["/app"]
```


- - -


## Community Events

### Singapore

- [GopherCon](https://gophercon.sg)
- [GoSG](https://www.meetup.com/en-SG/golangsg/)
