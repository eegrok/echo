#!/usr/bin/env ruby
require 'socket'

PORT = 23123
server = nil
if ARGV.count == 1
  server = ARGV[0]
  puts "echoing tcp data on port: #{PORT} on #{server}"
else
  puts "echoing tcp data on port: #{PORT} on all interfaces"
end

server = TCPServer.new(server, PORT)
loop do
  client = server.accept
  while line = client.gets
    puts "echoing back: #{line}"
    client.puts line
  end
  client.close
end
