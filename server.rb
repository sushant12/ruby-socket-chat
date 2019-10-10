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
    puts request
    @connections.each { |connection| connection.puts(request) }
  end
end

server = Server.new(4002)
server.start