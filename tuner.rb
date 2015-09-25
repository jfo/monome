class Tuner
    def equal(seed)
        out = []
        out << seed
        16.times do
            out << seed *= (2.0**(1.0/12.0))
        end
        out[1..-1]
    end
    def guitar
         [
          equal(440.0),
          equal(329.6),
          equal(246.9),
          equal(196),
          equal(146.8),
          equal(110),
          equal(82.4),
          equal(61.73)
        ]
    end
end
