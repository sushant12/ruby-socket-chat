require 'socket'

# bind server to port 4000
server = TCPServer.new(4000)
puts "====== Server started on 4000 ====="
# wait for client to connect
loop do
  puts "===== Waiting for requests ======"
  client = server.accept
  puts "===== Request received ======"
  client.puts client.gets
  puts "===== Closing client ========"
  client.close
end
