require 'socket'

Socket.tcp_server_loop(4481) do |conn|
  conn.write('Welcome ' << conn.read_nonblock(200))
  conn.close
rescue Errno::EAGAIN
  # puts "retrying"
  IO.select([conn])
  retry
rescue EOFError
  break
end
