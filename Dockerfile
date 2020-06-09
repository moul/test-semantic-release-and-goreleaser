# dynamic config
ARG             BUILD_DATE
ARG             VCS_REF
ARG             VERSION

# build
FROM            golang:1.14-alpine as builder
RUN             apk add --no-cache git gcc musl-dev make
ENV             GO111MODULE=on
WORKDIR         /go/src/moul.io/test-semantic-release-and-goreleaser
COPY            go.* ./
RUN             go mod download
COPY            . ./
RUN             make install

# minimalist runtime
FROM alpine:3.12
LABEL           org.label-schema.build-date=$BUILD_DATE \
                org.label-schema.name="test-semantic-release-and-goreleaser" \
                org.label-schema.description="" \
                org.label-schema.url="https://moul.io/test-semantic-release-and-goreleaser/" \
                org.label-schema.vcs-ref=$VCS_REF \
                org.label-schema.vcs-url="https://github.com/moul/test-semantic-release-and-goreleaser" \
                org.label-schema.vendor="Manfred Touron" \
                org.label-schema.version=$VERSION \
                org.label-schema.schema-version="1.0" \
                org.label-schema.cmd="docker run -i -t --rm moul/test-semantic-release-and-goreleaser" \
                org.label-schema.help="docker exec -it $CONTAINER test-semantic-release-and-goreleaser --help"
COPY            --from=builder /go/bin/test-semantic-release-and-goreleaser /bin/
ENTRYPOINT      ["/bin/test-semantic-release-and-goreleaser"]
#CMD             []
