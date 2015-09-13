class SerialOSC
    ON = 1
    OFF = 0

    def initialize
        @client = OSC::Client.new('localhost', "12002" )
    end

    # /sys/port i <port> - change destination port
    def port(p)
        send OSC::Message.new(
                "/sys/port", p
        ).encode
    end

    # /sys/host s <host> - change destination host
    def host(host)
        send OSC::Message.new(
                "/sys/host", host
        ).encode
    end

    # /sys/prefix s <prefix> - change message prefix (filtering)
    def prefix(prefix)
        send OSC::Message.new(
                "/sys/prefix", prefix
        ).encode
    end

    # /sys/rotation i <degrees> - rotate the monome by degrees, 0, 90, 180, 270 
    def rotation(deg)
        send OSC::Message.new(
                "/sys/rotation", deg
        ).encode
    end

    # /sys/info si <host> <port>
    def info(host, port)
        send OSC::Message.new(
                "/serialosc/list", host, port
        ).encode
    end

    # # /sys/info i <port>
    # def info(host, port)
    #     send OSC::Message.new(
    #             "/sys/info", host, port
    #     ).encode
    # end

    # /sys/info
    # /info si <host> <port> (send /sys/info messages to host:port)
    # /info i <port> (send to localhost:port)
    # /info (send to current destination application's host:port)

    def send(msg)
        @client.send(msg)
    end
end

s = SerialOSC.new
s.info "localhost", 1234
