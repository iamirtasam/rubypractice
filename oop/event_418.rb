# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid product width")
    super
  end
end

class WeatherReport
  MIN_WIDTH = 10
  MAX_WIDTH = 189

  def initialize(product)
    @product = product
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "width \#{val} out of [10,189] range" unless (10..189).include?(val)
    @width = val
  end

  def width
    raise WeatherReportError, "width not set" if @width.zero?
    @width
  end
end

test_values = [14, -3, 216, 68]

obj = WeatherReport.new("product_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
