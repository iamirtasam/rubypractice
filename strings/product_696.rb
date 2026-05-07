# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid product median")
    super
  end
end

class WeatherReport
  MIN_MEDIAN = 7
  MAX_MEDIAN = 60

  def initialize(product)
    @product = product
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "median \#{val} out of [7,60] range" unless (7..60).include?(val)
    @median = val
  end

  def median
    raise WeatherReportError, "median not set" if @median.zero?
    @median
  end
end

test_values = [27, -1, 109, 19]

obj = WeatherReport.new("product_test")
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
