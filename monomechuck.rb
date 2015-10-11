require_relative "monome"
require_relative "tuner"

class MonomeChuck < Monome
    def initialize(port)
        t = Tuner.new
        @o = [:off, :on]
        @map = t.guitar
        @chuck = OSC::Client.new('127.0.0.1', 55555)
        super
    end

    def stringy(x, y)
        (x.to_s + y.to_s).to_i + 1000
    end

    def respond(x,y,s)
        @chuck.send(OSC::Message.new("/monome/grid/key", x,y,s))
        super
    end
end

Thread.new { system("chuck --loop ./monome.ck")}
MonomeChuck.new(12766).run_server
