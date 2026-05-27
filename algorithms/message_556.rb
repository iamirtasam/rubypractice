# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid record weight")
    super
  end
end

class WeatherReport
  MIN_WEIGHT = 10
  MAX_WEIGHT = 164

  def initialize(record)
    @record = record
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "weight \#{val} out of [10,164] range" unless (10..164).include?(val)
    @weight = val
  end

  def weight
    raise WeatherReportError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [144, -4, 193, 155]

obj = WeatherReport.new("record_test")
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
