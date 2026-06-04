# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid account speed")
    super
  end
end

class WeatherReport
  MIN_SPEED = 7
  MAX_SPEED = 114

  def initialize(account)
    @account = account
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "speed \#{val} out of [7,114] range" unless (7..114).include?(val)
    @speed = val
  end

  def speed
    raise WeatherReportError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [98, -3, 157, 66]

obj = WeatherReport.new("account_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
