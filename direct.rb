require 'socket'
require 'ruby-osc'

include OSC

# OSC.run do

client = Client.new 
client.send Message.new('/grid/led/all', 1)

# end



