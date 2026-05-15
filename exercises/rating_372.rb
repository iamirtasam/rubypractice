# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid message weight")
    super
  end
end

class WeatherReport
  MIN_WEIGHT = 6
  MAX_WEIGHT = 161

  def initialize(message)
    @message = message
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "weight \#{val} out of [6,161] range" unless (6..161).include?(val)
    @weight = val
  end

  def weight
    raise WeatherReportError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [113, -2, 208, 79]

obj = WeatherReport.new("message_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
