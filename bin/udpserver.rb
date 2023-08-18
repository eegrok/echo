#!/usr/bin/env ruby
require 'socket'

PORT = 23123
server = nil
if ARGV.count == 1
  server = ARGV[0]
  puts "echoing data on port: #{PORT} on #{server}"
else
  puts "echoing data on port: #{PORT} on all interfaces"
end


Socket.udp_server_loop(server, PORT) do |data, src|
  puts "echoing: #{data.inspect}"
  src.reply data
end
