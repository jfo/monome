#!/usr/bin/env ruby

require 'rubygems'
require 'serialport'

ser = SerialPort.new("/dev/tty.usbserial-m1000065", 9600)

loop do
    der = ser.readline(1).ord.to_s(16).to_i
    if der == 21
        x = ser.readline(1).ord.to_s(16)
        y = ser.readline(1).ord.to_s(16)
        ser.write("\x11")
        ser.write(x)
        ser.write(y)
    end

    if der == 20
        ser.write("\x12")
    end
end
