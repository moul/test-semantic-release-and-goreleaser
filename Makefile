GOPKG ?=	moul.io/test-semantic-release-and-goreleaser
DOCKER_IMAGE ?=	moul/test-semantic-release-and-goreleaser
GOBINS ?=	.
NPM_PACKAGES ?=	.

include rules.mk

.PHONY: _set_version
_set_version:
	sed -i 's/Version = "[^"]*"/Version = "$(VERSION)"/' version.go
