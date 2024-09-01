docker-compose build --no-cache edb-server-mailer
docker-compose --profile mailer up -d --no-deps --build
