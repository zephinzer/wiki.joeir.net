# Software Engineering / Golang

Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.

- [Software Engineering / Golang](#software-engineering--golang)
  - [Installation](#installation)
    - [Installation on Ubuntu](#installation-on-ubuntu)
  - [Links](#links)
  - [Decision Patterns](#decision-patterns)
  - [Useful Packages](#useful-packages)
  - [Useful Scripts](#useful-scripts)
    - [System Administration](#system-administration)
      - [Environment Checking](#environment-checking)
    - [Development](#development)
      - [Installing Dependencies](#installing-dependencies)
      - [Updating Dependencies](#updating-dependencies)
      - [Running Commands](#running-commands)
      - [Running Tests](#running-tests)
    - [Building](#building)
      - [Basic Build](#basic-build)
      - [Static Build](#static-build)
      - [Symbols Stripped Build](#symbols-stripped-build)
      - [Cross-Platform Build](#cross-platform-build)
      - [Variable Injection Build](#variable-injection-build)
      - [Windows-GUI Build](#windows-gui-build)
  - [Dockerfile Recipes](#dockerfile-recipes)
  - [Makefile Recipes](#makefile-recipes)
  - [Useful Tools](#useful-tools)
  - [Community Events](#community-events)
    - [Singapore](#singapore)

- - -


## Installation

### Installation on Ubuntu

```sh
sudo add-apt-repository ppa:longsleep/golang-backports;
sudo apt update;
sudo apt install golang-go;
```


- - -


## Links

- [Main website](https://golang.org/)
- [Wikipedia](https://en.wikipedia.org/wiki/Go_(programming_language))


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

| Name | Description | URL |
| --- | --- | --- |
| Cobra | CLI framework | [https://github.com/spf13/cobra](https://github.com/spf13/cobra) |
| Gorilla Mux | HTTP request multiplexer | [https://github.com/gorilla/mux](https://github.com/gorilla/mux) |
| Litter | `console.log` for Go | [https://github.com/sanity-io/litter](https://github.com/sanity-io/litter) |
| Logrus | Logging | [https://github.com/sirupsen/logrus](https://github.com/sirupsen/logrus) |
| UUID | Unique ID generator | [https://github.com/google/uuid](https://github.com/google/uuid) |
| Testify | Testing framework | [https://github.com/stretchr/testify](https://github.com/stretchr/testify) |
| Viper | Configuration management | [https://github.com/spf13/viper](https://github.com/spf13/viper) |


- - -


## Useful Scripts

### System Administration

#### Environment Checking

```sh
go env
```

### Development

#### Installing Dependencies

```sh
go mod vendor -v;
```

#### Updating Dependencies

```sh
go mod tidy -v;
```

#### Running Commands

```sh
go run ./cmd/command;
```

#### Running Tests

```sh
go test -cover -coverprofile c.out ./...;
```

### Building

The following formulae expects that an invoker runs these from the root directory given a project layout as specificied at [https://github.com/golang-standards/project-layout](https://github.com/golang-standards/project-layout).

#### Basic Build

```sh
go build -o ./bin/command ./cmd/command
```

#### Static Build

```sh
CGO_ENABLED=0 \
  go build \
  -ldflags "-extldflags 'static'" \
  -o ./bin/command \
  ./cmd/command;
```

#### Symbols Stripped Build

```sh
go build \
  -ldflags "-s -w" \
  -o ./bin/command \
  ./cmd/command;
```

#### Cross-Platform Build

```sh
GOOS=windows GOARCH=386 \
  go build \
  -o ./bin/command \
  ./cmd/command;
```

#### Variable Injection Build

The following assumes the presence of the variables `commitHash`, `version`, and `buildTimestamp` in the `main` package:

```sh
go build \
  -ldflags "-X main.commitHash=$(git rev-parse --verify HEAD) \
    -X main.version=$(git describe --tag $(git rev-list --tags --max-count=1)) \
    -X main.buildTimestamp=$(date +'%Y%m%d%H%M%S')" \
  -o ./bin/command \
  ./cmd/command;
```

#### Windows-GUI Build

```sh
GOOS=windows GOARCH=386 \
  go build \
  -ldflags '-H=windowsgui' \
  -o ./bin/command \
  ./cmd/command;
```


- - -


## Dockerfile Recipes

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

## Makefile Recipes

```Makefile
deps:
	go mod vendor -v
	go mod tidy -v
run:
	go run ./cmd/$(CMD_ROOT)
test:
	go test -v ./... -cover -coverprofile c.out
build:
	CGO_ENABLED=0 \
	go build \
		-v \
		-o ./bin/$(CMD_ROOT)_$$(go env GOOS)_$$(go env GOARCH)${BIN_EXT} \
		./cmd/$(CMD_ROOT)
build_production:
	CGO_ENABLED=0 \
	go build \
		-a -v \
		-ldflags "-X main.Commit=$$(git rev-parse --verify HEAD) \
			-X main.Version=$$(git describe --tag $$(git rev-list --tags --max-count=1)) \
			-X main.Timestamp=$$(date +'%Y%m%d%H%M%S') \
			-extldflags 'static' \
			-s -w" \
		-o ./bin/$(CMD_ROOT)_$$(go env GOOS)_$$(go env GOARCH)${BIN_EXT} \
		./cmd/$(CMD_ROOT)
```

- - -


## Useful Tools

| Name | Description | Link |
| --- | --- | --- | 
| Go | Rich Go language support for Visual Studio Code | [https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go) |


- - -


## Community Events

### Singapore

- [GopherCon](https://gophercon.sg)
- [GoSG](https://www.meetup.com/en-SG/golangsg/)
