require 'socket'
require 'osc-ruby'

# UDP_HOST = "127.0.0.1"
# # UDP_PORT = "12002"
# UDP_PORT = "12766"

@payload = OSC::Message.new( "/thcthing/", "si 127.0.0.1 1234" )
@client = OSC::Client.new('192.168.1.130', "8000" )

@thingy = "/thcthing/\x00\x00,s\x00\x00si 127.0.0.1 1234\x00\x00\x00"

# @client.send(@payload)
@client.send(@thingy)

# @client2 = OSC::Client.new('localhost', "1234" )
# @client2.send(@payload.encode)

# p @payload.class.instance_methods(false)
# p @payload.encode


# u2 = UDPSocket.new
# u2.connect("127.0.0.1", 12002)
# u2.send @thingy, 0

# socket = UDPSocket.new
# socket.send(@payload, 0, UDP_HOST, UDP_PORT)
# socket.close

