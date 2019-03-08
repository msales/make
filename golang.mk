include github.com/msales/make/todo
include github.com/msales/make/env

# Build the commands
build:
	@find ./cmd/* -maxdepth 1 -type d -exec go build {} \;
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
	@golint ./...
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

# Download the go.mod dependencies
download:
	@go mod download
.PHONY: download

# Tidy the go.mod file
tidy:
	@echo "==> Cleaning go.mod"
	@go mod tidy
	@echo "==> Done"
.PHONY: imports

# Perform the initial setup for the project
setup: env download
