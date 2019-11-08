class Array
  def square(arr)
    return arr_r = arr.map { |elem| elem * elem }
  end

  def average(arr)
    return arr_r = arr.inject(:+).to_f / arr.size
  end

  def even_odd(arr)
    arr_even = arr.select { |number| number.even? }
    arr_odd = arr.select { |number| number.odd? }
    return arr_even.size - arr_odd.size
  end

  def reverse_strings(arr)
    return arr_reverse = arr_s.map { |word| word.reverse }
  end

end

arr = [5, 6, 1, 3, 8]
arr_s = ["my", "power", "is", "growing"]
