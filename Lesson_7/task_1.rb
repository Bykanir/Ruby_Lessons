
a = [5, 4, 1, 2, 3, 6, 10, 12]
b = []
c = [1, 2, 3, 4]

def score_throws(radiuses)
  final_score =  0

  return puts "Final score = 0" if radiuses.empty?

  radiuses.each do |throw|
    final_score += case throw
                   when 0...5
                     10
                   when 5..10
                     5
                   else
                     0
                   end
  end

  final_score += 100 if radiuses.all? { |throw| throw < 5  }

  puts "Final score = #{final_score}"
end

score_throws(a)
