request = gets.chomp

def ask(string)
  return puts "invalid request" if string.class != String

  days_for_year = Time.now.year

  if days_for_year % 4 == 0 && days_for_year % 100 != 0 || days_for_year % 400 == 0
    days_for_year = 366
  else
    days_for_year = 365
  end

  case string
  when "time"
    puts "#{Time.now.hour}:#{Time.now.min}"
  when "date"
    puts Time.now.strftime "%e %B,%Y"
  when "day"
    puts Time.now.strftime "%A"
  when "remaining days"
    puts days_for_year - Time.now.strftime("%j").to_i
  when "remaining weeks"
    puts (days_for_year - Time.now.strftime("%j").to_i) / 7
  end
end

ask(request)
