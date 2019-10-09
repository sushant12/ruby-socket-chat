require 'socket'

class Server
  def initialize(port)
    @server = TCPServer.new(port)
    puts "Listening on port #{port}"
  end

  def start
    Socket.accept_loop(@server) do |connection|
      handle(connection)
      connection.close
    end
  end

  private

  def handle(connection)
    request = connection.read_nonblock(1024)
    connection.write(request)
  end
end

server = Server.new(4002)
server.start