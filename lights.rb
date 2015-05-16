#!/usr/bin/env ruby
# require 'rubygems'
require 'serialport'

ser = SerialPort.new("/dev/tty.usbserial-m1000065", 9600)
# ser.write("\x13")
# sleep 1
# ser.write("\x12")
#

    # puts ser.getc().ord.to_s(16).to_i
#


loop do
    thinger = ser.getc().ord.to_s(16)
    if thinger == "21"
        x = ser.getc
        y = ser.getc
        ser.write("\x11" + x + y)
    elsif thinger == "20"
        x = ser.getc
        y = ser.getc
        ser.write("\x10" + x + y)
    end
end
