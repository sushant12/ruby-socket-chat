require 'socket'

socket = TCPSocket.new 'localhost', 4000
puts "==== Connected to 4000 ===="
socket.puts 'Sus'
puts "==== Wrote to socket ===="
puts socket.gets
puts "==== Print values from socket ===="
socket.close