# puts "Hello"

# t = gets.chomp
# s = gets.chomp
# # Pretty Print
# puts s + t
# pp (s + t) 

print "a?"
a = gets.to_i
# puts a * 2

# if a >= 0
#   puts "Positive"
# else
#   puts "Negative"
# end

if a > 0
  puts "Positive"
elsif a == 0
  puts "Zero"
else
  puts "Negative"
end

print "name?"
name = gets.chomp
if name == "KSU"
  puts "Hello"
else
  puts "Hi!"
end

q = 5
# if q = 3
#   puts "Three"
# end

# if修飾子
puts "Three" if q == 3

puts "Not Three" if q != 3
puts "Not Three" unless q == 3

