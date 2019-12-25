require 'socket'

class Client
  class << self
    attr_accessor :host, :port
  end

  def self.request
    @client = TCPSocket.new(host, port)
    listen
    send
  end

  def self.listen
    Thread.new do
      loop do
        puts "====#{@client.gets}"
      end
    end
  end

  def self.send
    Thread.new do
      loop do
        msg = $stdin.gets.chomp
        @client.puts(msg)
      end
    end.join
  end
end


Client.host = '127.0.0.1'
Client.port = 4002
Client.request
