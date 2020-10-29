#!/usr/bin/expect
set timeout 2
spawn "openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem"
expect “Question 1 :” { send “123456789\n” }
expect “Question 2 :” { send “ES\n” }
expect “Question 3 :” { send “Madrid\n” }
expect “Question 4 :” { send “Madrid\n” }
expect “Question 5 :” { send “42\n” }
expect “Question 6 :” { send “.\n” }
expect “Question 7 :” { send “Miki\n” }
expect “Question 8 :” { send “mrosario@student.42madrid.com\n” }
interact