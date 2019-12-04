def perform(action, array)
  if block_given?
    case action
    when "find words"
      yield(array)
    when "parse numbers"
      yield(array)
    end
   else
     p "Please, give me instructions"
   end
end

arr_string = ["lo str", "boo tr fal", "wal ee rr tt ff qqwh numb", "ee rr tt ff qq"]
arr_number = [3, 2, 1]

perform("find words", arr_string) do |arrays_words|
  arr_words = arrays_words.map { |arr_words| arr_words.split }
  sort_arr_words = arr_words.sort_by { |arr_words| arr_words.size }
  return sort_arr_words.last.join(" ")
end

perform("parse numbers", arr_number) do |arr_numbers|
  hash_numbers = {}
  arr_numbers.each_with_index do |number, index|
    hash_numbers.store(index+1, number)
  end
  return hash_numbers
end
