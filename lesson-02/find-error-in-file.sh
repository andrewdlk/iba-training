#!/bin/bash

echo "Enter file name: "
read FILENAME

if grep -q "error" $FILENAME
	then
		echo "$FILENAME contains a word "error"!" && rm $FILENAME
	else
		echo "$FILENAME doesn't contain a word "error"! "
fi

