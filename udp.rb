require 'socket'
require 'osc-ruby'

def blink
    payload1 = OSC::Message.new( "/monome/grid/led/all", 1 )
    payload2 = OSC::Message.new( "/monome/grid/led/all", 0 )
    client = OSC::Client.new('localhost', "12766" )
    client.send(payload1)
    sleep 1
    client.send(payload2)
end


def ask
    client = OSC::Client.new('localhost', "12002" )
    payload = OSC::Message.new( "/serialosc/list", "localhost", 1234)
    client.send(payload)
end
ask

def thing
    inthing = ->{
        "inderp"
    }

    puts "derp"
    puts inthing.call
end

def blinker
    on = ->(x,y){OSC::Message.new( "/monome/grid/led/set", x, y, 1 )}
    off = ->(x,y){OSC::Message.new( "/monome/grid/led/set", x, y, 0 )}
    client = OSC::Client.new('localhost', "12451" )

    10.times do
        client.send(on.call(rand(15),rand(8)))
       client.send(off.call(rand(15),rand(8)))
    end
    client.send(OSC::Message.new( "/monome/grid/led/all", 0 ))
end

# blinker

# p @payload.class.instance_methods(false)
# p @payload.encode


# u2 = UDPSocket.new
# u2.connect("127.0.0.1", 12002)
# u2.send @thingy, 0

# socket = UDPSocket.new
# socket.send(@payload, 0, UDP_HOST, UDP_PORT)
# socket.close

