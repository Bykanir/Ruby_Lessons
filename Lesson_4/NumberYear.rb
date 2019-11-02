mas_month = [31, 28,  31, 30,  31,  30,  31, 31, 30, 31, 30, 31]


puts 'Enter day'
day = gets.chomp.to_i

puts 'Enter month'
month = gets.chomp.to_i

puts 'Enter year'
year = gets.chomp.to_i

if  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    mas_month[1] = 29
end

result = 0

if month == 1
  result = day
else
  result = mas_month[0..(month-2)].inject(:+) + day
end

puts "Day serial number #{result}"
