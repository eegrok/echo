#!/usr/bin/env ruby
require 'socket'

PORT = 23123
puts "echoing data on port: #{PORT}"
Socket.udp_server_loop(PORT) do |data, src|
  puts "echoing: #{data.inspect}"
  src.reply data
end
