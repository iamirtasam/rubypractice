# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid invoice width")
    super
  end
end

class WeatherReport
  MIN_WIDTH = 1
  MAX_WIDTH = 62

  def initialize(invoice)
    @invoice = invoice
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "width \#{val} out of [1,62] range" unless (1..62).include?(val)
    @width = val
  end

  def width
    raise WeatherReportError, "width not set" if @width.zero?
    @width
  end
end

test_values = [12, -4, 103, 48]

obj = WeatherReport.new("invoice_test")
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
