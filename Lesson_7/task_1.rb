a = [5, 4, 1, 2, 3, 6, 10, 12]
b = []
c = [1, 2, 3, 4]

def score_throws(arr)
  final_score =  0

  if arr.empty?
    return puts "Final score = 0"
  end

  arr.each do |throw|
    if throw < 5
      throw = 10
    elsif throw > 10
      throw = 0
    else
      throw = 5
    end
    final_score += throw
  end

  if arr.all? { |throw| throw < 5  }
    final_score += 100
  end

  puts "Final score = #{final_score}"
end

score_throws(c)
