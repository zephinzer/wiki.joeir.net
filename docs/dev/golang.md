# Golang

- [Decision Patterns](#decision-patterns)
- [Useful Packages](#useful-packages)
- [Useful Scripts](#useful-scripts)
- [Community Events](#community-events)

## Decision Patterns

- First class functions
- Support for native classes
- Lean keyword set
- Support for OOP
- Tuple returns
- Strongly typed language
- Type inference
- Compiled binaries

## Useful Packages

| Name | Category | URL |
| --- | --- | --- |
| Cobra | CLI framework | https://github.com/spf13/cobra |
| Logrus | Logging | https://github.com/sirupsen/logrus |
| UUID | Unique ID generator | https://github.com/google/uuid |
| Testify | Testing framework | https://github.com/stretchr/testify |
| Viper | Configuration management | https://github.com/spf13/viper |

## Useful Scripts

### Dependency Installation

```sh
go mod vendor -v
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
go build -a -ldflags "-extldflags 'static'" ./cmd/_
```

## Community Events

### Singapore

- [GopherCon](https://gophercon.sg)
- [GoSG](https://www.meetup.com/en-SG/golangsg/)