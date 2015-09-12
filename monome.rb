require 'osc-ruby'
class Monome
    ON = 1
    OFF = 0

    def initialize
        @client = OSC::Client.new('localhost', "12766" )
    end

    # /grid/led/set x y s
    # set led at (x,y) to state s (0 or 1) /grid/led/all s
    def light(x, y, s)
        send OSC::Message.new(
                "/monome/grid/led/set", x, y, s
        ).encode
    end
    def on(x, y) light x, y, ON end
    def off(x, y) light x, y, OFF end

    # /grid/led/all s
    # set all leds to state s (0 or 1).
    def all(s)
        send OSC::Message.new(
                "/monome/grid/led/all", s
        ).encode
    end
    def all_on
        all ON
    end
    def all_off
        all OFF
    end

    # /grid/led/map x_offset y_offset s[8]
    # Set a quad (8×8, 64 buttons) in a single message.
    def quad(x_off, y_off, s)
        send OSC::Message.new(
                "/monome/grid/led/map", x_off, y_off, s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7]
        ).encode
    end

    # /grid/led/row x_offset y s[..]
    # /grid/led/map x_offset y_offset s[8]
    def row(x_off, y, s)
        send OSC::Message.new(
                "/monome/grid/led/row", x_off, y, s[0], s[1]
        ).encode
    end

    # /grid/led/col x y_offset s[..]
    def column(x, y_off, s)
        send OSC::Message.new(
                "/monome/grid/led/col", x_off, y, s[0], s[1]
        ).encode
    end

    # /grid/led/intensity i
    def intensity(i)
        send OSC::Message.new(
                "/monome/grid/led/intensity", i
        ).encode
    end

    # /grid/led/level/set x y l
    def level(x, y, i)
        send OSC::Message.new(
                "/monome/grid/led/level/set", x, y, i
        ).encode
    end
    # /grid/led/level/all l
    def level(l)
        send OSC::Message.new(
                "/monome/grid/led/level/all", l
        ).encode
    end
    # /grid/led/level/map x_off y_off l[64]
    # /grid/led/level/row x_off y l[..]
    # /grid/led/level/col x y_off l[..]

    # def encode_osc(msg)
    #     OSC::Message.new(msg[0], eval("msg[1...-1]")).encode
    # end

    private

    def send(msg)
        @client.send(msg)
    end





    # /tilt/set n s
    # set active state of tilt sensor n to s (0 or 1, 1 = active, 0 = inactive)
end

m = Monome.new


m.all_off
gets

