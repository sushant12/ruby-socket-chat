require 'socket'

class Client
  class << self
    attr_accessor :host, :port
  end

  def self.request
    @client = TCPSocket.new(host, port)
    @client.write('hello world')
    @client.read
  end
end


Client.host = '0.0.0.0'
Client.port = 4002
puts Client.request