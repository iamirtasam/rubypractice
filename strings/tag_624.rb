# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid category output")
    super
  end
end

class WeatherReport
  MIN_OUTPUT = 3
  MAX_OUTPUT = 94

  def initialize(category)
    @category = category
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "output \#{val} out of [3,94] range" unless (3..94).include?(val)
    @output = val
  end

  def output
    raise WeatherReportError, "output not set" if @output.zero?
    @output
  end
end

test_values = [17, -1, 139, 6]

obj = WeatherReport.new("category_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
