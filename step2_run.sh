./step1_pull.sh

#docker-compose down
#docker image rm docker-rust-edb-api-web
#docker-compose up -d

# generate keys if they don't exist
if [[ ! -f "jwtRS256.key" ]]
then
	./create_rsa_keys.sh
fi

# start redis
docker-compose up -d --no-deps --build redis

# start mail service
docker-compose up -d --no-deps --build edb-server-mailer

# start the server
docker-compose up -d --no-deps --build edb-server

# start nginx
docker-compose up -d --no-deps --build nginx
