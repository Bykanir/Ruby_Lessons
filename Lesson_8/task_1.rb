class Array
  def square
    self.map { |elem| elem * elem }
  end

  def average
    self.inject(:+).to_f / self.size
  end

  def even_odd
    even, odd = self.partition { |number| number.even? }
    result = even - odd
  end

  def reverse_strings
    self.map { |word| word.reverse }
  end

end

arr = [5, 6, 1, 3, 8]
arr_s = ["my", "power", "is", "growing"]
arr.even_odd
