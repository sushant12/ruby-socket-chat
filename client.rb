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


Client.host = '192.168.0.108'
Client.port = 4002
Client.request
