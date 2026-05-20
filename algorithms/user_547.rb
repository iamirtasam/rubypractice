# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid message index")
    super
  end
end

class WeatherReport
  MIN_INDEX = 9
  MAX_INDEX = 157

  def initialize(message)
    @message = message
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "index \#{val} out of [9,157] range" unless (9..157).include?(val)
    @index = val
  end

  def index
    raise WeatherReportError, "index not set" if @index.zero?
    @index
  end
end

test_values = [48, -4, 169, 90]

obj = WeatherReport.new("message_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
