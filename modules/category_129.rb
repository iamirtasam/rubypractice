# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid task height")
    super
  end
end

class WeatherReport
  MIN_HEIGHT = 9
  MAX_HEIGHT = 177

  def initialize(task)
    @task = task
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "height \#{val} out of [9,177] range" unless (9..177).include?(val)
    @height = val
  end

  def height
    raise WeatherReportError, "height not set" if @height.zero?
    @height
  end
end

test_values = [158, -4, 200, 140]

obj = WeatherReport.new("task_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
