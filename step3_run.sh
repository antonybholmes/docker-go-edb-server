
#docker-compose down
#docker image rm docker-rust-edb-api-web
#docker-compose up -d

# generate keys if they don't exist
if [[ ! -f "jwtRS256.key" ]]
then
	./create_rsa_keys.sh
fi

# start redis
docker-compose --profile redis up -d --no-deps --build

# start mail service
docker-compose build --no-cache edb-server-mailer
docker-compose --profile mailer up -d --no-deps --build

# start the server
docker-compose build --no-cache edb-server
docker-compose up -d --no-deps --force-recreate edb-server

# start nginx
docker-compose up -d --no-deps --build nginx
