# docker-go-edb-server

Contains the Dockerfiles and scripts to start the EDB server app.

## Setup

1. Run `step3_run.sh` to create both the app and the nginx proxy docker images and start them.
2. `compose.yaml` contains the docker compose details needed to build the separate images.
3. The app requires a pair of public and private RSA keys for signing JWTs. It will look for `jwtRS256.key` and if not found will create the keys for you, otherwise you need to supply your own.
# docker-go-edb-server
