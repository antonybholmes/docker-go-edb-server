# generate keys if they don't exist
if [[ ! -f "jwtRS256.key" ]]
then
	./create_rsa_keys.sh
fi

docker-compose build --no-cache edb-server
# rebuild in background then replace once built
docker-compose up -d --no-deps --force-recreate edb-server
