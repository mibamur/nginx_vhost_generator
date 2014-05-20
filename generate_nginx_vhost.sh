#!/bin/bash

set -e

# some functions
random-pass() { 
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${3:-28} | head -n 1
}

# properties
VHOST_DB_ROOT_USER='root'
VHOST_DB_ROOT_PASS='mysqlpassword'
VHOSTDIR=/var/www
VHOSTSKEL=/var/www/.skel/vhost-default

# start
echo -e 'Ok! Now we going to start new vhost and maybe some else.'
echo -e '!!! Better answer y/n and other questions in lower case!!!'
echo -e "Specify the vhost domain name ( my.site.org or mysite ):"
read VHOST

if [ "$VHOST" = "" ] ; then
	echo "Invalid domain!"
	exit 1;
fi

# cope and parse
VHOSTPATH="$VHOSTDIR/$VHOST"
echo "copy $VHOSTSKEL/ $VHOSTPATH"
sudo -u debadmin cp -Rf "$VHOSTSKEL/" "$VHOSTPATH"
sudo -u debadmin ack-grep -l VHOSTDIR $VHOSTPATH/conf/* | xargs -t -n 1 sed -i -e "s@VHOSTDIR@$VHOSTDIR@g"
sudo -u debadmin  ack-grep -l DOMAIN $VHOSTPATH/conf/* | xargs -t -n 1 sed -i -e "s@DOMAIN@$VHOST@g"
#sudo -u debadmin  ack-grep -l SERVERIP $VHOSTPATH/conf/* | xargs -t -n 1 sed -i -e "s@SERVERIP@$VHOSTIP@g"
echo "Skeleton copied to \"$VHOSTPATH\"";


# SSL
echo -e "Add SSL? (Y/n)";
YESNO="y"
read YESNO
if [ "$YESNO" = "y" ] ; then
   openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout $VHOSTPATH/conf/ssl/$VHOST.key -out $VHOSTPATH/conf/ssl/$VHOST.crt
fi



# MySql
echo -e "Add Mysql new User and DB? (Y/n)";
YESNO="y"
read YESNO

VHOST_DB_PASS=$(random-pass)
# echo -e "Random pass: $VHOST_DB_PASS"
# echo -e "Enter another password for DB or press ENTER to use this:";

VHOST_USER=$( echo $VHOST | sed -e 's#.#_#g' )
VHOST_DB=$VHOST_USER

if [ "$YESNO" = "y" ] ; then
  mysql -u $VHOST_DB_ROOT_USER -p$VHOST_DB_ROOT_PASS -e "CREATE DATABASE $VHOST_DB;"
  mysql -u $VHOST_DB_ROOT_USER -p$VHOST_DB_ROOT_PASS -e "CREATE USER '$VHOST_USER'@'localhost' IDENTIFIED BY '$VHOST_DB_PASS';"
  mysql -u $VHOST_DB_ROOT_USER -p$VHOST_DB_ROOT_PASS -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON $VHOST.* TO '$VHOST'@'localhost';"
  mysql -u $VHOST_DB_ROOT_USER -p$VHOST_DB_ROOT_PASS -e "FLUSH PRIVILEGES;"
  echo -e "User: $VHOST_DB";
  echo -e "Pass: $VHOST_DB_PASS";
fi


# install framework
YESNO="y"
echo -e "Install framework?";
read YESNO

if [ "$YESNO" = "y" ] ; then
  echo "TODO"
fi


# pre-configure vhost
YESNO="y"
echo -e "Choose pre-configure framework vhost?";
read YESNO

if [ "$YESNO" = "y" ] ; then
  echo "TODO"
fi



# nginx
YESNO="y"
sudo nginx -t
echo -e "Reload nginx (Y/n)";
read YESNO

if [ "$YESNO" = "y" ] ; then
  sudo nginx -s reload
fi





