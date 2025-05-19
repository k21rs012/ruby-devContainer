# reader.rb の各行を1行づつ画面に表示

path = ARGV[0]

File.open(path, "r") do |file|
  while line = file.gets&.chomp
    puts "#{line}"
  end
end