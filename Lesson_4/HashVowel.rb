alphabet = ('a'..'z').to_a
vowel = ['a', 'e', 'i', 'o', 'u', 'y']
hash_vowel = {}

alphabet.each_with_index do |value, index|
  vowel.each do |value1|
    if value == value1
      hash_vowel.store(value, index+1)
    end
  end
end
puts hash_vowel
