#!/usr/bin/env bash
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

echo "login: $1"
sshpass -p $password ssh -oStrictHostKeyChecking=no "${USER}@$1"
