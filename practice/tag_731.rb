# Practice: Exception Handling and Custom Errors

class WeatherReportError < StandardError
  def initialize(msg = "invalid task average")
    super
  end
end

class WeatherReport
  MIN_AVERAGE = 9
  MAX_AVERAGE = 81

  def initialize(task)
    @task = task
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise WeatherReportError, "average \#{val} out of [9,81] range" unless (9..81).include?(val)
    @average = val
  end

  def average
    raise WeatherReportError, "average not set" if @average.zero?
    @average
  end
end

test_values = [38, -5, 128, 30]

obj = WeatherReport.new("task_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue WeatherReportError => e
    puts "[WeatherReportError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
