require_relative "monome.rb"
m = Monome.new

x = 0
x2 = 0
loop do
    x+=1
    m.quad 0, 0, [
        x,
        x+1,
        x+2,
        x+3,
        x+4,
        x+5,
        x+6,
        x+7
    ]

    if x == 255
        x = 0
        x2 += 1

        m.quad(-1, 0, [
            x2,
            x2,
            x2,
            x2,
            x2,
            x2,
            x2,
            x2
        ])
    end
    sleep 0.0001

end
