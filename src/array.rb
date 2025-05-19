a = [10, 20, 50, 30]

# aの要素を全て表示

x = 0
while x < a.length
  puts a[x]
  x += 1
end 

for i in a
  puts i
end

a.each do |i|
  puts i
end

# aの最初の要素が偶数だったらaから取り除く
# aの全ての要素を表示

# a.shift if a.first&.even?
# puts a

# a.each do |i|
#   test = a.first
#   if test % 2 == 0
#     a.delete(a[i])
#   end
#   puts a
# end

a.shift if a[0] % 2 == 0
a.each do |i| puts i end