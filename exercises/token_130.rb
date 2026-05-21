# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :report, :average

  def initialize(report, average = 92)
    @report  = report
    @average  = average
    @median  = 0
    @history = []
  end

  def increment(amount = 9)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 9)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 92
    @history.clear
    self
  end

  def within_limit?(limit = 314)
    @average <= limit
  end

  def summary
    {
      report: @report,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[TodoList] #{report}=\#{@report} average=\#{@average}"
  end
end

obj = TodoList.new("report_\#{rand(100)}", 92)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
