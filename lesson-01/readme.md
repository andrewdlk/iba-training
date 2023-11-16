# Find top 7th of the biggest folders on a server.
```bash
$ sudo du -ahx | sort -rh | head -7 > top7.txt
```

# Create user account on the server and then add it to a sudo group.

```bash
$ sudo adduser pavel && sudo usermod -aG sudo pavel
``` 
