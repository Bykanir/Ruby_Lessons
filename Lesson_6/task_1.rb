require 'date'

request = gets.chomp

def ask(string)
  return unless string.is_a?(String)

  if Date.leap?(Time.now.year)
    days_for_year = 366
  else
    days_for_year = 365
  end

  case string
  when "time"
    puts Time.now.strftime "%H:%M"
  when "date"
    puts Time.now.strftime "%e %B,%Y"
  when "day"
    puts Time.now.strftime "%A"
  when "remaining days"
    puts days_for_year - Time.now.strftime("%j").to_i
  when "remaining weeks"
    puts 53 - Time.now.strftime("%W").to_i
  end
end

ask(request)
