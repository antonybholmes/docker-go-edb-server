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
source .env
set +o allexport

# start postgres
docker restart pg-db
docker restart pgadmin4
 
# clear it if not being rebuilt
docker restart valkey

#docker-compose up -d --no-deps --build kafka

# start mail service
#docker-compose up -d --no-cache --no-deps --build edb-mail-server
docker restart edb-mail-server
 
# Start only the specified service(s) without starting dependent services
docker restart edb-server

# start nginx
docker restart nginx

docker restart otel-collector

docker restart prometheus

docker restart grafana


