# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid payment ratio")
    super
  end
end

class WeatherReport
  MIN_RATIO = 7
  MAX_RATIO = 140

  def initialize(payment)
    @payment = payment
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "ratio \#{val} out of [7,140] range" unless (7..140).include?(val)
    @ratio = val
  end

  def ratio
    raise WeatherReportError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [76, -5, 183, 28]

obj = WeatherReport.new("payment_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
