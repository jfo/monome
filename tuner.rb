class Tuner
    def equal(seed)
        out = []
        out << seed
        15.times do
            out << seed *= (2.0**(1.0/12.0))
        end
        out
    end
    def guitar
         [equal(329.6),
         equal(329.6),
          equal(246.9),
          equal(196),
          equal(146.8),
          equal(110),
          equal(82.4),
          equal(82.4)
        ]
    end
end
