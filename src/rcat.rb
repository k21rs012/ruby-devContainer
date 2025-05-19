# コマンドラインで指定した全てのファイルの各行を1行づつ画面に表示

ARGV.each do |path|

  File.open(path, "r") do |file|
    while line = file.gets&.chomp
      puts line
    end
  end
end