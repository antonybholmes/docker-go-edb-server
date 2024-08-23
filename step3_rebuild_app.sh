# generate keys if they don't exist
if [[ ! -f "jwtRS256.key" ]]
then
	./go-edb-api/create_rsa_keys.sh
fi

# rebuild in background then replace once built
docker-compose up -d --no-deps --build edb-web-app
