require_relative 'requireable.rb'

t = [99, 1100, 22, 341]

t.each_with_index { |unit, index| puts "#{index + 1} - #{unit}" }
