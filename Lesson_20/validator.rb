module Validator
  def number_valid?(number)
    number_error if number.empty?
  end

  def name_valid?(name)
    name_error if name.empty?
  end

  private

  def name_error
    raise "Name is missing"
  end

  def number_error
    raise "Number is missing"
  end
end
