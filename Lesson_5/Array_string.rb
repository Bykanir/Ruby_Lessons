arr = ["I", "will", "become", "cool", "programmer", "hope =)"]


def min_max_word(array)
  sizes = []
  array.each do |i|
    sizes << i.size
  end
  puts sizes.min, sizes.max
end

min_max_word(arr)
