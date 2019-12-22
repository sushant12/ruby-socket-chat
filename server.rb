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
      puts @connections
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
    connection.close if request.nil?
    @connections.each do |client|
      next if client.closed?
      client.puts(request) if client != connection && !client.closed?
    end
  end
end

server = Server.new(4002)
server.start