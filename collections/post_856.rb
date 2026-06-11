# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid token total")
    super
  end
end

class WeatherReport
  MIN_TOTAL = 7
  MAX_TOTAL = 78

  def initialize(token)
    @token = token
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "total \#{val} out of [7,78] range" unless (7..78).include?(val)
    @total = val
  end

  def total
    raise WeatherReportError, "total not set" if @total.zero?
    @total
  end
end

test_values = [78, -1, 99, 14]

obj = WeatherReport.new("token_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
