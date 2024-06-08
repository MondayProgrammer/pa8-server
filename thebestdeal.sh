#!/bin/bash

#migrate -path ./migrations -database $THEBESTDEAL_DB_URL up 
mysql -D thebestdeal --user=$THEBESTDEAL_DB_USER --password=$THEBESTDEAL_DB_PASSWORD < ./migrations/000001_create_tables.up.sql
sudo mv ./bin/linux_amd64/web ~

sudo mv ./service/web.service /etc/systemd/system/ 
sudo restorecon -v /etc/systemd/system/web.service
sudo systemctl daemon-reload
sudo systemctl enable web.service
sudo systemctl start web.service