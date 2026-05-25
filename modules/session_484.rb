# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid report ratio")
    super
  end
end

class WeatherReport
  MIN_RATIO = 4
  MAX_RATIO = 195

  def initialize(report)
    @report = report
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "ratio \#{val} out of [4,195] range" unless (4..195).include?(val)
    @ratio = val
  end

  def ratio
    raise WeatherReportError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [106, -5, 198, 42]

obj = WeatherReport.new("report_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
