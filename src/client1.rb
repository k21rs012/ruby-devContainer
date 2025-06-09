#! /usr/local/bin/ruby

require 'socket'
# host = ARGV[0]
# path = ARGV[1]
host, path = ARGV

# ./client1.rb host pathで実行できるようにする

s = TCPSocket.open(host, "http")
# s.puts "GET / HTTP/1.0\r\n\r\n"
# s.puts "Host: www.is.kyusan-u.ac.jp"
# s.print("GET / HTTP/1.0\r\n")
# s.print("GET /~toshi/ HTTP/1.1\r\n")
s.print("GET #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("Connection: close\r\n")
s.print("\r\n")

while line = s.gets&.chomp
  puts line
end

