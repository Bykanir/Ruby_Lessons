def perform(action, array)
  return "Please, give me instructions" unless block_given?

  case action
  when "find words"
    yield(array)
  when "parse numbers"
    yield(array)
  end
end

arr_string = ["lo str", "boo tr fal", "wal ee rr tt ff qqwh numb", "ee rr tt ff qq"]
arr_number = [3, 2, 1]

perform("parse numbers", arr_number) do |arr_numbers|
  hash_numbers = {}
  arr_numbers.each_with_index do |number, index|
    hash_numbers.store(index+1, number)
  end
  hash_numbers
end

perform("find words", arr_string) do
  arr_string.map(&:split).sort_by(&:size).last.join(' ')
end
