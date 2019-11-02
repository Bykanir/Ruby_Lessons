string = "1 2 3 3 -4"

def min_max_number(str)
  m = []
  m << str.split.min
  m << str.split.max
  print m
end

min_max_number(string)
