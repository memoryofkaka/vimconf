#!/usr/bin/expect
set timeout 5
spawn ssh -p 10020 miyuandong@119.188.50.147
    expect "miyuandong@bigo"
    send "sudo -s\r"
    expect "root@bigo:"
    send "docker exec -it live bash\r"
    interact
