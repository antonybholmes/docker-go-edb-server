FROM golang AS build-stage

# RUN apk update
# RUN apk add -U --no-cache ca-certificates && update-ca-certificates

WORKDIR /

ADD src/go-edbserver-gin/ go-edbserver-gin/
ADD src/go-dna/ go-dna/
ADD src/go-genome/ go-genome/
ADD src/go-web/ go-web/
ADD src/go-basemath/ go-basemath/
ADD src/go-mailserver/ go-mailserver/
ADD src/go-edbmailserver/ go-edbmailserver/
ADD src/go-sys/ go-sys/
ADD src/go-mutations/ go-mutations/
ADD src/go-geneconv/ go-geneconv/
ADD src/go-pathway/ go-pathway/
ADD src/go-motifs/ go-motifs/
ADD src/go-gex/ go-gex/
ADD src/go-seqs/ go-seqs/
ADD src/go-beds/ go-beds/
ADD src/go-cytobands/ go-cytobands/
ADD src/go-hubs/ go-hubs/
ADD src/go-scrna/ go-scrna/

# get the repositories we need
#RUN git clone https://github.com/antonybholmes//go-edbserver.git && \
#	git clone https://github.com/antonybholmes//go-dna.git && \
#	git clone https://github.com/antonybholmes//go-genes.git && \
#	git clone https://github.com/antonybholmes//go-web.git && \
#	git clone https://github.com/antonybholmes//go-basemath.git && \
#	git clone https://github.com/antonybholmes//go-sys.git && \
#	git clone https://github.com/antonybholmes//go-mailserver.git && \
#	git clone https://github.com/antonybholmes//go-mutations.git && \
#	git clone https://github.com/antonybholmes//go-geneconv.git && \
#	git clone https://github.com/antonybholmes//go-pathway.git && \
#	git clone https://github.com/antonybholmes//go-motifs.git && \
#	git clone https://github.com/antonybholmes//go-gex.git

WORKDIR /go-edbserver-gin

RUN go mod tidy

# build statically so runs without dependencies
#RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o edbserver
RUN GIN_MODE=release CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o edbserver


# move app into smaller alpine image
FROM debian AS release-stage

WORKDIR /

# need to copy certs for some reason as go email doesn't work without them
# https://stackoverflow.com/questions/52969195/docker-container-running-golang-http-client-getting-error-certificate-signed-by
COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=build-stage /go-edbserver-gin/edbserver edbserver

# aux files needed by app
# COPY --from=build-stage /go-edbserver-gin/templates/ /templates
COPY --from=build-stage /go-edbserver-gin/consts.env /
COPY --from=build-stage /go-edbserver-gin/version.env /

# COPY .env /

# copy keys for signing jwts etc
# COPY jwtRS256.key /
# COPY jwtRS256.key.pub /
# COPY auth0.key.pub /
# COPY clerk.key.pem /

# default port
EXPOSE 8080

# CMD ["./edbserver"]
CMD GIN_MODE=release BUILD=production ./edbserver
