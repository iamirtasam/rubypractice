# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid post length")
    super
  end
end

class WeatherReport
  MIN_LENGTH = 3
  MAX_LENGTH = 57

  def initialize(post)
    @post = post
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "length \#{val} out of [3,57] range" unless (3..57).include?(val)
    @length = val
  end

  def length
    raise WeatherReportError, "length not set" if @length.zero?
    @length
  end
end

test_values = [46, -1, 80, 41]

obj = WeatherReport.new("post_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
