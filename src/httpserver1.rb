#!　/usr/bin/ruby

# 1. TCP80で接続を待ち受ける
# 2. whileの繰り返しで、行を読み込む
# 2.1 読み込んだ行をソケットに送り返す
require "socket"

# ポート80で待ち受け
s0 = TCPServer.open(80)

loop do
  sock = s0.accept
  Thread.new do
    while line = sock.gets&.chomp
      pp line
      sock.puts line
      # 空行で終了
      break if line.empty?
    end
    # 接続を閉じる
    sock.close
    sleep 10
  end
end


