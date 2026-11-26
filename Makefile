.PHONY: build test vendor lint

GO ?= go
BIN ?= ./vpsinspect
SOURCE_DATE_EPOCH ?= 0

LDFLAGS := -s -w -buildid=

build:
	CGO_ENABLED=0 $(GO) build -trimpath -buildvcs=false -mod=vendor \
		-ldflags="$(LDFLAGS)" -o $(BIN) ./cmd/vpsinspect

test:
	$(GO) test -race ./...

vendor:
	$(GO) mod tidy
	$(GO) mod vendor
	$(GO) mod verify