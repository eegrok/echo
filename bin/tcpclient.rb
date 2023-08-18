#!/usr/bin/env ruby
require 'socket'

if ARGV.size != 1
  puts "usage: tcpclient.rb <server-addr>"
  exit 1
end

PORT = 23123

puts "sending hello to tcp #{ARGV[0]}:#{PORT}"
# client
socket = Socket.new(:INET, :STREAM)
addr = Socket.sockaddr_in(PORT, ARGV[0])
socket.connect(addr)
begin
  socket.send "hello\n", 0
  puts socket.gets
ensure
  socket.close
end
