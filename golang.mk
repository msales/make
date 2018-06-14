include github.com/msales/make/bump
include github.com/msales/make/todo

# Build the commands
build:
	@go build ./cmd/...
.PHONY: build

# Run all tests
test:
	@go test -cover ./...
.PHONY: test

# Vet the project
vet:
	@go vet ./...
.PHONY: vet

# Lint the project
lint:
	@golint $(shell go list ./... | grep -v /vendor/)
.PHONY: lint

# Data race detector
race:
	@go test -race ./...

# Run CI tasks
ci: lint build vet test race
.PHONY: ci

# Format all files
fmt:
	@echo "==> Formatting source"
	@gofmt -s -w $(shell find . -type f -name '*.go' -not -path "./vendor/*")
	@echo "==> Done"
.PHONY: fmt

# Format all files and fix imports
imports:
	@echo "==> Formatting source"
	@goimports -w $(shell find . -type f -name '*.go' -not -path "./vendor/*")
	@echo "==> Done"
.PHONY: imports