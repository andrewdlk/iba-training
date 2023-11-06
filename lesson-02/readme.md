# Using bash script find word "Error" in the file and if this file consist in the file then remove this file. find-error-in-file.sh:

#!/bin/bash

read -p "Enter file name: " FILENAME

if grep -s "error" $FILENAME
	then 
		echo "$FILENAME contains a word "error"!" && rm $FILENAME
	else
		echo "$FILENAME doesn't contains a word "error""
fi

==========================================================================

# Using bash script create user. but if rhis user consist in the server then echo message about it. newuser-add.sh:

#!/bin/bash

read -p "Please, enter the name for a new user: " NEWUSER

if grep $NEWUSER /etc/passwd; then
	echo "This user name exist in the system already!"
else
	sudo adduser $NEWUSER && sudo usermod -aG sudo $NEWUSER
fi

===========================================================================

# Create own simple systemd service

1)  sudo nano /usr/local/bin/myservice.sh

#!/bin/bash
set -o errexit
set -o nounset
yourname=$(whoami)
while true; do
  echo "Mr.(s) $yourname. This service show you date and time on your OS: "$(date)""
  sleep 10
done


2)  sudo nano /etc/systemd/system/myservice.service

[Unit]
Description=Simple user service that show you time and date

[Service]
ExecStart=/usr/local/bin/myservice.sh
Restart=Always
User=pro

[Install]
WantedBy=multi-user.target


3) $ sudo systemctl start myservice
   $ sudo systemctl status myservice
   $ sudo systemctl restart myservice
   $ sudo systemctl enable myservice
   $ sudo systemctl edit --full myservice
 
