FROM golang AS build-stage

# RUN apk update
# RUN apk add -U --no-cache ca-certificates && update-ca-certificates

WORKDIR /

ADD src/go-edbmailserver/ go-edbmailserver/
ADD src/go-web/ go-web/
ADD src/go-sys/ go-sys/
ADD src/go-mailserver/ go-mailserver/

# get the repositories we need
# RUN git clone https://github.com/antonybholmes//go-edbmailserver.git && \
# git clone https://github.com/antonybholmes//go-auth.git && \
# git clone https://github.com/antonybholmes//go-sys.git && \
# git clone https://github.com/antonybholmes//go-mailserver.git

WORKDIR /go-edbmailserver

RUN go mod tidy

# build statically so runs without dependencies
RUN CGO_ENABLED=1 GOOS=linux BUILD=production go build --tags "fts5" -o edbmail

# move app into smaller alpine image
FROM debian:stable-slim AS release-stage

WORKDIR /

# need to copy certs for some reason as go email doesn't work without them
# https://stackoverflow.com/questions/52969195/docker-container-running-golang-http-client-getting-error-certificate-signed-by
COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=build-stage /go-edbmailserver/edbmail edbmail

# aux files needed by app
COPY --from=build-stage /go-edbmailserver/templates/ /templates
COPY --from=build-stage /go-edbmailserver/consts.env /
COPY --from=build-stage /go-edbmailserver/version.json /

# COPY .env /

CMD BUILD=production ./edbmail
