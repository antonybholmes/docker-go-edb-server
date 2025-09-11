FROM golang AS build-stage

# RUN apk update
# RUN apk add -U --no-cache ca-certificates && update-ca-certificates

WORKDIR /

ADD src/go-edb-server-mailer/ go-edb-server-mailer/
ADD src/go-web/ go-web/
ADD src/go-sys/ go-sys/
ADD src/go-mailer/ go-mailer/

# get the repositories we need
#RUN git clone https://github.com/antonybholmes//go-edb-server-mailer.git && \
#	git clone https://github.com/antonybholmes//go-auth.git && \
#	git clone https://github.com/antonybholmes//go-sys.git && \
#	git clone https://github.com/antonybholmes//go-mailer.git

WORKDIR /go-edb-server-mailer

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o edb-server-mailer

# move app into smaller alpine image
FROM debian AS release-stage

WORKDIR /

# need to copy certs for some reason as go email doesn't work without them
# https://stackoverflow.com/questions/52969195/docker-container-running-golang-http-client-getting-error-certificate-signed-by
COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=build-stage /go-edb-server-mailer/edb-server-mailer edb-server-mailer

# aux files needed by app
COPY --from=build-stage /go-edb-server-mailer/templates/ /templates
COPY --from=build-stage /go-edb-server-mailer/consts.env /
COPY --from=build-stage /go-edb-server-mailer/version.env /
COPY .env /

# copy keys for signing jwts etc
# COPY jwtRS256.key /
# COPY jwtRS256.key.pub /

CMD BUILD=production ./edb-server-mailer
