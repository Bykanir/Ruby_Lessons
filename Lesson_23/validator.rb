module Validator
  module Route
    def validate(first_station, last_station)
      [first_station, last_station].each { |station| station_error if station.name.empty? }
    end

    private

    def station_error
      raise 'Station is missing in route'
      rescue Exception => e 
        write_error('error.log', e)
    end
  end

  module Station
    def validate(name)
      name_error if name.empty?
    end

    private

    def name_error
      raise 'Name is missing'
      rescue Exception => e 
        write_error('error.log', e)
    end
  end

  module Train
    def validate(number)
      number_error if number.empty?
    end

    private

    def number_error
      raise 'Number is missing'
      rescue Exception => e 
        write_error('error.log', e)
    end
  end

  def write_error(file_path, error)
    File.open(file_path, 'a') do |f|
      f.puts "#{Time.now}; Class - #{self.class}; ERRORS -#{error}"
    end
  end
end
