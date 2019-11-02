puts 'Enter 1 number '
a = gets.chomp.to_f

puts 'Enter 2 number'
b = gets.chomp.to_f

puts 'Enter 3 number'
c = gets.chomp.to_f

d = b**2 - (4 * a * c)

if d > 0
  d = Math.sqrt(d)
  x1 = -b + d / 2 * a
  x2 = -b - d / 2 * a
  puts "Дискриминант = #{d}; 1-й корень #{x1}; 2-й корень #{x2}"
elsif d == 0
  x1 = -(b / 2 * a)
  puts "Дискриминант = #{d}; корень #{x1}"
else d < 0
  puts "Дискриминант = #{d}; корней нет"
end
