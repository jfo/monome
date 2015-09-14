require 'osc-ruby'

@server = OSC::Server.new(1234)

@server.add_method "/serialosc/device" do |msg|
    puts msg.to_a
end
# @server.run


@client = OSC::Client.new('localhost', 12002)

@client.send(OSC::Message.new(
    "/sys/port", 12345
).encode)
