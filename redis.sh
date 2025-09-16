set -o allexport
source .prod.env
set +o allexport

envsubst < redis/redis.template.conf > redis/redis.conf
docker-compose up -d --no-deps --build redis
