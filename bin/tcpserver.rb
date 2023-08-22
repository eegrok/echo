#!/usr/bin/env ruby
require 'socket'

port = 23123
server = nil
if ARGV.count > 0
  server = ARGV[0]
  if ARGV.count > 1
    port = ARGV[1].to_i
  end
  puts "echoing tcp data on port: #{port} on #{server}"
else
  puts "echoing tcp data on port: #{port} on all interfaces"
end

server = TCPServer.new(server, port)
loop do
  client = server.accept
  while line = client.gets
    puts "echoing back: #{line}"
    client.puts line
  end
  client.close
end
