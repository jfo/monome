require 'osc-ruby'

@client = OSC::Client.new( 'localhost', 12002 )
@client.send( OSC::Message.new( "/serialosc/list", "si <localhost> <1234>"))
