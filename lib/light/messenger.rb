require 'socket'

module Light
  class Messenger
    def initialize ip=nil, port=nil
      @ip = ip || ENV['SERVER_IP']
      @port = port || ENV['SERVER_PORT']
      
      @socket = UDPSocket.new
    end

    def lights_on
      post "\x22\x00\x55"
    end

    def lights_off
      post "\x21\x00\x55"
    end

    def brightest
      (0..6).each do
        brighter
        sleep 0.1
      end
    end

    def brighter
      post "\x23\x00\x55"
    end

    def darkest
      (0..6).each do
        darker
        sleep 0.1
      end
    end

    def darker
      post "\x24\x00\x55"
    end

    def colour colour='00'
      colour = colour.to_s(16).hex.chr
      post "\x20#{colour}\x55"
    end

    private
    def post msg
      @socket.send msg, 0, @ip, @port
    end
  end
end
