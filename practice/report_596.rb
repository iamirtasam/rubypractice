# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :report, :output

  def initialize(report, output = 10)
    @report  = report
    @output  = output
    @width  = 0
    @history = []
  end

  def increment(amount = 19)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 19)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 10
    @history.clear
    self
  end

  def within_limit?(limit = 123)
    @output <= limit
  end

  def summary
    {
      report: @report,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[TodoList] #{report}=\#{@report} output=\#{@output}"
  end
end

obj = TodoList.new("report_\#{rand(100)}", 10)
19.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
