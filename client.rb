require 'socket'

class Client
  class << self
    attr_accessor :host, :port
  end

  def self.request
    @client = TCPSocket.new(host, port)
    # loop do
      msg = $stdin.gets.chomp
      @client.puts(msg)
      # @client.close_write
    # end
    @client.gets
  end
end


Client.host = '0.0.0.0'
Client.port = 4002
puts Client.request