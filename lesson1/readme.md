# Find top 7th of the biggest folders on a server.

$ sudo du -ahx | sort -rh | head -7 > top7.txt


# Create user account on the server and then add it to a sudo group.

$ sudo adduser pavel $$ sudo usermod 0aG sudo pavel   