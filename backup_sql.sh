#!/bin/bash
#MySQL credentials
USER="test"
PASSWORD="test"
DATABASE="sakila"
BACKUP_DIR="/home/ubuntu/"
DATE=$(date +"%Y%m%d")
#Backup command
sudo mysqldump $DATABASE > $BACKUP_DIR/db_backup_$DATE.sql
Print message
echo "Backup for $DATABASE completed on $DATE"

