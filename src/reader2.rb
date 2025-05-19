path = ARGV[0]
# 行頭に行番号を表示
File.open(path, "r") do |file|

  count = 1
  while line = file.gets&.chomp
    # puts count.to_s + ":" + line
    puts "#{count}: #{line}"
    count += 1
  end

end
