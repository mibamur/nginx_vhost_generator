mysqldump -u $VHOST -p$VHOST_DB_PASS $VHOST | gzip > $VHOST_`date +%d.%m.%Y_%T`.sql.gz
zcat $1 | mysql -u $VHOST -p$VHOST_DB_PASS $VHOST
