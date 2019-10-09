require 'socket'
require 'thread'

class Server
  def initialize(port)
    @server = TCPServer.new(port)
    puts "Listening on port #{port}"
  end

  def start
    Socket.accept_loop(@server) do |connection|
      Thread.new do
        handle(connection)
        connection.close
      end
    end
  end

  private

  def handle(connection)
    request = connection.gets
    puts request
    sleep(5)
    connection.puts(request)
  end
end

server = Server.new(4002)
server.start