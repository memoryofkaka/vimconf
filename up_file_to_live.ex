#!/usr/bin/expect
set timeout 30
set filename [lindex $argv 0]
set destination [lindex $argv 1]

spawn scp -P 10020 $filename miyuandong@119.188.50.147:/home/miyuandong
expect eof

spawn ssh -p 10020 miyuandong@119.188.50.147
expect "miyuandong@bigo"
send "sudo -s\r"
expect "root@bigo:"
send "docker cp $filename live:$destination \r"
expect "root@bigo:/home/miyuandong"
send "rm $filename \r"
send "docker exec -it live bash\r"
expect "root@"
send "cd $destination \r"
interact
