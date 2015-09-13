require 'osc-ruby'

ON = 1
OFF = 0

@client = OSC::Client.new('localhost', "12451" )
# To device

# /grid/led/set x y s
# set led at (x,y) to state s (0 or 1) /grid/led/all s
def set_led(x, y, s)
    OSC::Message.new( "/monome/grid/led/set", x, y, s).encode
end

# set all leds to state s (0 or 1).
# /grid/led/all s
def set_all_leds(s)
    OSC::Message.new("/monome/grid/led/all", s).encode
end

# /grid/led/map x_offset y_offset s[8]
# Set a quad (8×8, 64 buttons) in a single message.
# Each number in the list is a bitmask of the buttons in a row,
# one number in the list for each row.
# The message will fail if the list doesn't have 8 entries plus offsets.
def set_quad(x_offset, y_offset, s_array)
    OSC::Message.new( "/monome/grid/led/map", x_offset, y_offset, s_array[0], s_array[1], s_array[2], s_array[3], s_array[4], s_array[5], s_array[6], s_array[7]).encode
end

# /grid/led/row x_offset y s[..]
# Set a row in a quad in a single message
def set_row(x_offset, y, s)
    OSC::Message.new( "/monome/grid/led/map", x_offset, y_offset, eval(y.join(', '))).encode
end

# ar = ["derp", "hellp"]
# print eval("ar.join(', ')")

loop do
    inn = []
    8.times { inn << rand(255) }

    (-1..0).each do |i|
        @client.send(set_quad(i, 0, inn))
    end
    sleep 0.5
    sleep 0.5
end




# /grid/led/col x y_offset s[..]
# Set a column in a quad in a single message
# /grid/led/intensity i [0, 3] – off | [4, 7] - low | [8, 11] - medium | [12, 15] - high June 2012 devices allow the full 16 intensity levels
# /grid/led/level/set x y l
# /grid/led/level/all l
# /grid/led/level/map x_off y_off l[64]
# /grid/led/level/row x_off y l[..]
# /grid/led/level/col x y_off l[..]
# /tilt/set n s # set active state of tilt sensor n to s (0 or 1, 1 = active, 0 = inactive)

# to serialosc

# /sys/port i <port> - change destination port
# /sys/host s <host> - change destination host
# /sys/prefix s <prefix> - change message prefix (filtering)
# /sys/rotation i <degrees> - rotate the monome by degrees, 0, 90, 180, 270 /sys/info si <host> <port>
# /sys/info i <port>
# /sys/info
# /info si <host> <port> (send /sys/info messages to host:port)
# /info i <port> (send to localhost:port)
# c
# /info (send to current destination application's host:port)

# from serialosc
# /sys/port i report destination port /sys/host s report destination host /sys/id s report device id /sys/prefix s report prefix

# From device
# grid
# /grid/key x y s - key state change at (x,y) to s (0 or 1, 1 = key down, 0 = key up) tilt
# /tilt n x y z - position change on tilt sensor n, integer (8-bit) values (x, y, z)

