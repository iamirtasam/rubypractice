# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :report, :limit

  def initialize(report, limit = 58)
    @report  = report
    @limit  = limit
    @rate  = 0
    @history = []
  end

  def increment(amount = 12)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 12)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 58
    @history.clear
    self
  end

  def within_limit?(limit = 103)
    @limit <= limit
  end

  def summary
    {
      report: @report,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[TodoList] #{report}=\#{@report} limit=\#{@limit}"
  end
end

obj = TodoList.new("report_\#{rand(100)}", 58)
12.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
