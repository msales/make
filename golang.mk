include github.com/msales/make/bump
include github.com/msales/make/todo

# Build the commands
build:
	@go build ./cmd/...
.PHONY: build

# Run all tests
test:
	@go test -cover $(shell go list ./... | grep -v /vendor/)
.PHONY: test

# Vet the project
vet:
	@go vet $(shell go list ./... | grep -v /vendor/)
.PHONY: vet

# Run CI tasks
ci: build vet test
.PHONY: ci

# Format all files
fmt:
	@echo "==> Formatting source"
	@gofmt -s -w .
	@echo "==> Done"
.PHONY: fmt