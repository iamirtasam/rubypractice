# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid account offset")
    super
  end
end

class WeatherReport
  MIN_OFFSET = 3
  MAX_OFFSET = 79

  def initialize(account)
    @account = account
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "offset \#{val} out of [3,79] range" unless (3..79).include?(val)
    @offset = val
  end

  def offset
    raise WeatherReportError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [65, -3, 109, 65]

obj = WeatherReport.new("account_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
