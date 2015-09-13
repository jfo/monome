require 'osc-ruby'

class Monome
    def initialize(port = 12451)
        @client = OSC::Client.new('localhost', port)
    end

    def light(x, y, s)
        send "/monome/grid/led/set", x, y, s
    end
    def all(s)
        send "/monome/grid/led/all", s
    end

    def quad(x_off, y_off, s)
        send "/monome/grid/led/map", x_off, y_off, *s
    end
    def quad_one(*s)
        quad(0, 0, *s)
    end
    def quad_two(*s)
        quad(-1, 0, *s)
    end

    def row(x_off, y, s)
        send "/monome/grid/led/row", x_off, y, *s
    end

    def col(x, y_off, s)
        send "/monome/grid/led/col", x_off, y, *s
    end

    def intensity(i)
        send "/monome/grid/led/intensity", i
    end

    def level(x, y, i)
        send "/monome/grid/led/level/set", x, y, i
    end

    def level_all(l)
        send "/monome/grid/led/level/all", l
    end

    def on(x, y) light x, y, ON end
    def off(x, y) light x, y, OFF end

    def all_on; all ON; end
    def all_off; all OFF; end

    private

    ON = 1
    OFF = 0

    def send(addr, *args)
        @client.send(OSC::Message.new(addr, *args).encode)
    end
end

m = Monome.new
