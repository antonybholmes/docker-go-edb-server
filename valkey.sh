set -o allexport
source .env
set +o allexport

envsubst < valkey/valkey.template.conf > valkey/valkey.conf
docker-compose up -d --remove-orphans --no-deps --build valkey
docker restart valkey
