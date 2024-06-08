#!/bin/bash

migrate -path ./migrations -database $$THEBESTDEAL_DB_URL up 
sudo mv ./service/web.service /etc/systemd/system/ 
sudo restorecon -v /etc/systemd/system/web.service
sudo systemctl daemon-reload
sudo systemctl enable web.service
sudo systemctl restart web.service

reboot