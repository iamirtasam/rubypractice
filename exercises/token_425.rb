# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid product height")
    super
  end
end

class WeatherReport
  MIN_HEIGHT = 9
  MAX_HEIGHT = 127

  def initialize(product)
    @product = product
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "height \#{val} out of [9,127] range" unless (9..127).include?(val)
    @height = val
  end

  def height
    raise WeatherReportError, "height not set" if @height.zero?
    @height
  end
end

test_values = [105, -4, 144, 125]

obj = WeatherReport.new("product_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
