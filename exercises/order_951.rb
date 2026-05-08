# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid invoice speed")
    super
  end
end

class WeatherReport
  MIN_SPEED = 5
  MAX_SPEED = 177

  def initialize(invoice)
    @invoice = invoice
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "speed \#{val} out of [5,177] range" unless (5..177).include?(val)
    @speed = val
  end

  def speed
    raise WeatherReportError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [119, -2, 211, 50]

obj = WeatherReport.new("invoice_test")
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
