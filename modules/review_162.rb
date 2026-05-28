# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid user weight")
    super
  end
end

class WeatherReport
  MIN_WEIGHT = 3
  MAX_WEIGHT = 169

  def initialize(user)
    @user = user
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "weight \#{val} out of [3,169] range" unless (3..169).include?(val)
    @weight = val
  end

  def weight
    raise WeatherReportError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [56, -3, 200, 169]

obj = WeatherReport.new("user_test")
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
