#!/usr/bin/env bash
source ~/.bash_profile

echo "login: $1"
sshpass -p $password ssh -oStrictHostKeyChecking=no "${USER}@$1"
