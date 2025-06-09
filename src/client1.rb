#! /usr/local/bin/ruby

require 'socket'
host, path = ARGV

# ./client1.rb host pathで実行できるようにする
# ヘッダー情報を表示しないように改良

s = TCPSocket.open(host, "http")
s.print("GET #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("Connection: close\r\n")
s.print("\r\n")

# レスポンスのヘッダーを読み飛ばす
while line = s.gets&.chomp
  break if line.empty?
end

# ヘッダーを読み飛ばした後、ボディ部分を出力する
while line = s.gets&.chomp
  puts line
end

