#!/bin/bash

cp /home/user/Documents/work2.service /etc/systemd/system/
echo "service created in /etc/systemd/system/"

sudo systemctl start work
sudo systemctl enable work

