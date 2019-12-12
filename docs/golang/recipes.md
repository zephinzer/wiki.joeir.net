# Golang Recipes

| Category | Description | Command |
| --- | --- | --- |
| Setup | Dependency Installation | `go mod -v vendor` |
| Setup | Dependency Updating | `go mod -v tidy` |
| Develop | Run Command | `go run ./cmd/command` |
| Test | Run All Tests | `go test ./...` |
| Test | Run With Coverage | `go test -cover -coverprofile c.out ./...` |
| Build | Static Build | `go build -a -ldflags "-extldflags 'static' ./cmd/command"` |
