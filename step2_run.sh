#mkdir ../data/kafka
#sudo chown 1001:1001 ../data/kafka

#docker-compose down
#docker image rm docker-rust-edb-api-web
#docker-compose up -d

# generate keys if they don't exist
if [[ ! -f "jwtRS256.key" ]]
then
	./create_rsa_keys.sh
fi

set -o allexport
source .prod.env
set +o allexport

# start postgres
#docker-compose up -d --no-deps --build db
#docker-compose up -d --no-deps --build pgadmin4

# start mariadb
docker-compose up -d --no-deps --build db
docker-compose up -d --no-deps --build phpmyadmin

# start redis
# do some env sub so we can add password without storing it
envsubst < redis/redis.template.conf > redis/redis.conf
docker-compose up -d --no-deps --build redis

#docker-compose up -d --no-deps --build kafka

# start mail service
docker-compose up -d --no-deps --build edb-mail-server

# start the server
# make config available for access rules
#mkdir -p config
#cp src/go-edbserver-gin/config/* config/
docker-compose up -d --no-deps --build edb-server

# start nginx
docker-compose up -d --no-deps --build nginx
