require_relative "monome"
require_relative "tuner"


class MonomeMidi < Monome
    def initialize(port)
        t = Tuner.new
        @o = [:off, :on]
        @map = t.guitar
        @sc = OSC::Client.new('127.0.0.1', 57110)
        super
    end

    def stringy(x, y)
        (x.to_s + y.to_s).to_i + 1000
    end

    def respond(x,y,s)
        if s == 1
            @sc.send(OSC::Message.new("/s_new", "sine", stringy(x,y) , 1, 1 ,"freq", @map[y][x]).encode)
        elsif s == 0
            @sc.send(OSC::Message.new("/n_free", stringy(x,y)).encode)
        end

        super
    end
end

MonomeMidi.new 10325

sleep 1
