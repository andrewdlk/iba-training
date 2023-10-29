
#!/bin/bash

read -p "Please, enter the name for a new user: " NEWUSER

if grep $NEWUSER /etc/passwd; then
	echo "This user name exist in the system already!"
else
	sudo adduser $NEWUSER && sudo usermod -aG sudo $NEWUSER && USERGRP=$(sudo groups $NEWUSER) && echo $USERGRP 
fi
