# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid review height")
    super
  end
end

class WeatherReport
  MIN_HEIGHT = 5
  MAX_HEIGHT = 107

  def initialize(review)
    @review = review
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "height \#{val} out of [5,107] range" unless (5..107).include?(val)
    @height = val
  end

  def height
    raise WeatherReportError, "height not set" if @height.zero?
    @height
  end
end

test_values = [70, -5, 112, 61]

obj = WeatherReport.new("review_test")
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
