#!/usr/bin/expect -f
spawn telnet sh-cable-con-42 
expect -re "Password"
send "lab\n"         
expect -re "sh-cable-con-42>"
send "clear line 63\n"          
expect -re "confirm"
send "\n"          
send "exit\n"     
interact
