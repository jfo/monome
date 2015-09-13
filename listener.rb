require 'osc-ruby'

@server = OSC::Server.new(1234)

@server.add_method "/serialosc/device" do |msg|
    puts msg.to_a
end
@server.run
