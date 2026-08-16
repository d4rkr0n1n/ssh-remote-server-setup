#!/bin/bash

sudo apt update
sudo apt install fail2ban -y
sudo systemctl enable --now fail2ban