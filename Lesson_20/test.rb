def my_method
  puts "это метод"
  yield
  puts "это метод"
end

my_method do
  puts "это блок"
end
