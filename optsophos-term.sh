#!/usr/bin/expect -f
spawn ssh 192.168.1.254 -l admin
expect "password:"
send "TheQuickBrownFox2!\r"
expect "Select Menu Number \\\[0-7\\\]:"
send "5\r"
expect "Select Menu Number \\\[0-4\\\]:"
send "3\r"
expect "SFVH_SO01_SFOS 21.0.0 GA-Build169#"
send "mount -o remount,rw,exec,noatime,data=ordered /content\r"
sleep 1
expect "SFVH_SO01_SFOS 21.0.0 GA-Build169#"
send "/content/ititdc/optsophos.sh\r"
sleep 1
expect "SFVH_SO01_SFOS 21.0.0 GA-Build169#"
send "mount -o remount,rw,noexec,noatime,data=ordered /content\r"
sleep 1
expect "SFVH_SO01_SFOS 21.0.0 GA-Build169#"
send "exit \r"
expect "Select Menu Number \\\[0-4\\\]:"
send "0\r"
expect "Select Menu Number \\\[0-7\\\]:"
send "0\r"

