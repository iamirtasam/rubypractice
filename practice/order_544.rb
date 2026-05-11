# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid invoice limit")
    super
  end
end

class WeatherReport
  MIN_LIMIT = 9
  MAX_LIMIT = 154

  def initialize(invoice)
    @invoice = invoice
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "limit \#{val} out of [9,154] range" unless (9..154).include?(val)
    @limit = val
  end

  def limit
    raise WeatherReportError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [146, -4, 171, 61]

obj = WeatherReport.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
