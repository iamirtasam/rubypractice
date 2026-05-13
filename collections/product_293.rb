# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid item price")
    super
  end
end

class WeatherReport
  MIN_PRICE = 1
  MAX_PRICE = 127

  def initialize(item)
    @item = item
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "price \#{val} out of [1,127] range" unless (1..127).include?(val)
    @price = val
  end

  def price
    raise WeatherReportError, "price not set" if @price.zero?
    @price
  end
end

test_values = [16, -4, 135, 34]

obj = WeatherReport.new("item_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
