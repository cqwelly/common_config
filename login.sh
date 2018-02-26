#!/usr/bin/env bash
source ~/.bash_profile

echo $1
sshpass -p $password ssh -oStrictHostKeyChecking=no "chenqianli@$1"
