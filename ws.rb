require 'socket'

server = TCPServer.new('localhost', 2345)

loop do
  socket = server.accept

  STDERR.puts "Incoming Request"
  STDERR.puts socket.gets
  socket.close
end

server.close