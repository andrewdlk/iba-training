# Using bash script find word "Error" in the file and if this file consist in the file then remove this file:

#!/bin/bash

read -p "Enter file name: " FILENAME

if grep "error" $FILENAME
	then 
		echo "$FILENAME contains a word "error"!" && rm $FILENAME
	else
		echo "$FILENAME doesn't contains a word "error""
fi

==========================================================================

# Using bash script create user. but if rhis user consist in the server then echo message about it

#!/bin/bash

read -p "Please, enter the name for a new user: " NEWUSER

if grep $NEWUSER /etc/passwd; then
	echo "This user name exist in the system already!"
else
	adduser $NEWUSER
fi