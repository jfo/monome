require 'rubygems'
require 'serialport'

ser = SerialPort.new("/dev/tty.usbserial-m1000065", 9600)

loop do
    der = ser.readline(1).ord.to_s(16).to_i
    if der == 21
        ser.write("\x13")
    end

    if der == 20
        ser.write("\x12")
    end
end
