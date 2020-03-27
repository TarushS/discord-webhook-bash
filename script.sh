#!/bin/bash

if [ -f "config" ]; then
	usrname=`sed '1q;d' config`
	echo "Hello "$usrname
	webhk=`sed '2q;d' config`
	echo "Message:"; read mesg
else
	echo "[TIP]You can create a file named config and put your name in the first line and webhook in the second line"
	echo "Username:"; read usrname
	echo "Message:"; read mesg
	echo "Webhook:"; read webhk
fi

curl -H "Content-Type: application/json" -X POST -d '{"username": "'$usrname'", "content": "'$mesg'"}' $webhk

