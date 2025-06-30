#!　/usr/bin/ruby

# 1. TCP80で接続を待ち受ける
# 2. whileの繰り返しで、行を読み込む
# 2.1 読み込んだ行をソケットに送り返す
require "socket"
# 1行目のパス名だけをエコーバックする

# ポート80で待ち受け
s0 = TCPServer.open(80)

loop do
  sock = s0.accept
  Thread.new do
    line = sock.gets&.chomp
    # パスだけ表示
    path = line.split[1]
    case path
    when "/hello"
      sock.puts "HTTP/1.0 200 OK"
      sock.puts
      sock.puts "Hello World!"
    when "/93"
      sock.puts "HTTP/1.0 301 Moved Permanently"
      sock.puts "Location: http://www.kyusan-u.ac.jp"
      sock.puts
    else
      path = "./#{path}" # カレントディレクトリにあるファイルを読み込む
      if File.exist?(path)
        # パスをファイル名とみなして、そのファイルを読み込む
        sock.puts "HTTP/1.0 200 OK"
        sock.puts "Content-Type: text/plain; charset=UTF-8"
        sock.puts

        File.open(path, "r") do |file|
          while fl = file.gets&.chomp
            sock.puts fl
          end
        end
      else
        sock.puts "HTTP/1.0 404 Not Found"
        sock.puts
        sock.puts "File not found: #{path}"
      end
      # filename = File.basename(path)
      # if File.exist?(filename) && File.file?(filename)
      #   content = File.read(filename)
      #   sock.puts "HTTP/1.0 200 OK"
      #   sock.puts "Content-Type: text/plain; charset=UTF-8"
      #   sock.puts
      #   sock.puts content
      # else
      #   sock.puts "HTTP/1.0 404 Not Found"
      #   sock.puts
      # end
    end

    sock.close

    # # pathが/helloならHello World!を返す
    # if path == "/hello"
    #   sock.puts "HTTP/1.0 200 OK"
    #   sock.puts
    #   sock.puts "Hello World!"
    # # pathが/93ならリダイレクト
    # elsif path == "/93"
    #   sock.puts "HTTP/1.0 301 Moved Permanently"
    #   sock.puts "Location: http://www.kyusan-u.ac.jp"
    #   sock.puts
    # else
    #   sock.puts "HTTP/1.0 200 OK"
    #   sock.puts
    #   sock.puts path
    # end

    # while line = sock.gets&.chomp
    #   pp line
    #   sock.puts line
    #   # 空行で終了
    #   break if line.empty?
    # end
    # # 接続を閉じる
    # sock.close
    # sleep 10
  end
end
