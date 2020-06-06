module Validator
  def number_valid?(obj)
    name_error if obj.number.empty?
  end

  def name_valid?(obj)
    name_error if obj.name.empty?
  end

  def name_error
    raise NameError
  end
end
