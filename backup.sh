#!/bin/bash

source .env


PATH=${PATH}:/usr/local/bin/


#file=backups/booking-icg-backup-`date '+%Y-%m-%d'`.sql
file=/home/ec2-user/backups/booking-icg-backup-day`date '+%u'`.sql
docker exec -i db mariadb-dump -uroot -p${MYSQL_ROOT_PASSWORD} --databases edb --skip-comments > ${file}
gzip -f ${file}
