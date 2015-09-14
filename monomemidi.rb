require_relative "monome"

class MonomeMidi < Monome
    def respond(x,y,s)
        puts "#{x} #{y} #{s}"
    end
end

m = MonomeMidi.new 12766
