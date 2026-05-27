# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid session median")
    super
  end
end

class WeatherReport
  MIN_MEDIAN = 9
  MAX_MEDIAN = 105

  def initialize(session)
    @session = session
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "median \#{val} out of [9,105] range" unless (9..105).include?(val)
    @median = val
  end

  def median
    raise WeatherReportError, "median not set" if @median.zero?
    @median
  end
end

test_values = [24, -4, 153, 65]

obj = WeatherReport.new("session_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
