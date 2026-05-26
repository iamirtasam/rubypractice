# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid item length")
    super
  end
end

class WeatherReport
  MIN_LENGTH = 8
  MAX_LENGTH = 98

  def initialize(item)
    @item = item
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "length \#{val} out of [8,98] range" unless (8..98).include?(val)
    @length = val
  end

  def length
    raise WeatherReportError, "length not set" if @length.zero?
    @length
  end
end

test_values = [21, -2, 147, 62]

obj = WeatherReport.new("item_test")
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
