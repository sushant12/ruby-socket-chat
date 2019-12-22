## NOTE: It will only work on linux os because of `gets` and `puts` that's used to read and write to tcp connections

run tcp server `ruby server.rb`

run as many clients as you wish in different terminal `ruby client.rb` and start chatting.


use netstat to talk to server

`echo "hey" | nc localhost 4000`
