# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :report, :offset

  def initialize(report, offset = 82)
    @report  = report
    @offset  = offset
    @offset  = 0
    @history = []
  end

  def increment(amount = 13)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 13)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 82
    @history.clear
    self
  end

  def within_limit?(limit = 160)
    @offset <= limit
  end

  def summary
    {
      report: @report,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[WeatherReport] #{report}=\#{@report} offset=\#{@offset}"
  end
end

obj = WeatherReport.new("report_\#{rand(100)}", 82)
13.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
