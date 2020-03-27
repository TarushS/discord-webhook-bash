#!/bin/bash

if [ -f "config" ]; then
	usrname=`sed '1q;d' config`
	if [[ $usrname == "" ]]
	then
		echo "Please enter details in config file"
		exit 1
	fi
	echo "Hello "$usrname
	webhk=`sed '2q;d' config`
	echo "Message:"; read mesg
else
	echo "[TIP]You can create a file named config and put your name in the first line and webhook in the second line"
	echo "Username:"; read usrname
	echo "Message:"; read mesg
	echo "Webhook:"; read webhk
fi

if [[ $(curl $webhk) ]] 2>/dev/null;
then
	curl -H "Content-Type: application/json" -X POST -d '{"username": "'$usrname'", "content": "'$mesg'"}' $webhk
else
	echo "WebHook URL is invalid"
fi
