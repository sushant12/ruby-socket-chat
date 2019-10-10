require 'socket'

class Server
  def initialize(port)
    @server = TCPServer.new(port)
    @connections = []
    puts "Listening on port #{port}"
  end

  def start
    Socket.accept_loop(@server) do |connection|
      @connections << connection
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
    @connections.each do |client| 
      client.puts(request) if client != connection
    end
  end
end

server = Server.new(4002)
server.start