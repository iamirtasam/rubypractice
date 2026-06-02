# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid account discount")
    super
  end
end

class WeatherReport
  MIN_DISCOUNT = 2
  MAX_DISCOUNT = 83

  def initialize(account)
    @account = account
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "discount \#{val} out of [2,83] range" unless (2..83).include?(val)
    @discount = val
  end

  def discount
    raise WeatherReportError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [53, -5, 129, 31]

obj = WeatherReport.new("account_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
