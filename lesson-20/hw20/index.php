<?php
$ip_address = $_SERVER['SERVER_ADDR'];
echo "<h1>This Server works on Amazon EKS</h1><br>";
echo "The Server's IP address is: $ip_address", "<br><p>";
echo "Made by <font color=green>Andrew DL", "<br><p>";
echo "<font color=blue>Current PHP version: " . phpversion();
?>