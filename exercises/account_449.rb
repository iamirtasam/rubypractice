# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid message rate")
    super
  end
end

class WeatherReport
  MIN_RATE = 10
  MAX_RATE = 58

  def initialize(message)
    @message = message
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "rate \#{val} out of [10,58] range" unless (10..58).include?(val)
    @rate = val
  end

  def rate
    raise WeatherReportError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [31, -5, 83, 51]

obj = WeatherReport.new("message_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
