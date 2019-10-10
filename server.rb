require 'socket'

class Server
  def initialize(port)
    @server = TCPServer.new(port)
    puts "Listening on port #{port}"
  end

  def start
    Socket.accept_loop(@server) do |connection|
      Thread.new do
        loop do
          handle(connection)
        end
      end
    end
  end

  private

  def handle(connection)
    request = connection.gets
    puts request
    connection.puts(request)
  end
end

server = Server.new(4002)
server.start