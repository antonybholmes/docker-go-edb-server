FROM golang AS build-stage

# RUN apk update
# RUN apk add -U --no-cache ca-certificates && update-ca-certificates

WORKDIR /

ADD src/go-edb-server/ go-edb-server/
ADD src/go-dna/ go-dna/
ADD src/go-genes/ go-genes/
ADD src/go-auth/ go-auth/
ADD src/go-basemath/ go-basemath/
ADD src/go-mailer/ go-mailer/
ADD src/go-sys/ go-sys/
ADD src/go-mutations/ go-mutations/
ADD src/go-geneconv/ go-geneconv/
ADD src/go-pathway/ go-pathway/
ADD src/go-motifs/ go-motifs/
ADD src/go-gex/ go-gex/

# get the repositories we need
#RUN git clone https://github.com/antonybholmes//go-edb-server.git && \
#	git clone https://github.com/antonybholmes//go-dna.git && \
#	git clone https://github.com/antonybholmes//go-genes.git && \
#	git clone https://github.com/antonybholmes//go-auth.git && \
#	git clone https://github.com/antonybholmes//go-basemath.git && \
#	git clone https://github.com/antonybholmes//go-sys.git && \
#	git clone https://github.com/antonybholmes//go-mailer.git && \
#	git clone https://github.com/antonybholmes//go-mutations.git && \
#	git clone https://github.com/antonybholmes//go-geneconv.git && \
#	git clone https://github.com/antonybholmes//go-pathway.git && \
#	git clone https://github.com/antonybholmes//go-motifs.git && \
#	git clone https://github.com/antonybholmes//go-gex.git

WORKDIR /go-edb-server

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o edb-server

# move app into smaller alpine image
FROM debian AS release-stage

WORKDIR /

# need to copy certs for some reason as go email doesn't work without them
# https://stackoverflow.com/questions/52969195/docker-container-running-golang-http-client-getting-error-certificate-signed-by
COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=build-stage /go-edb-server/edb-server edb-server

# aux files needed by app
COPY --from=build-stage /go-edb-server/templates/ /templates
COPY --from=build-stage /go-edb-server/consts.env /
COPY --from=build-stage /go-edb-server/version.env /
COPY .env /

# copy keys for signing jwts etc
COPY jwtRS256.key /
COPY jwtRS256.key.pub /
COPY auth0.key.pub /

# default port
EXPOSE 8080

# CMD ["./edb-server"]
CMD BUILD=production ./edb-server
