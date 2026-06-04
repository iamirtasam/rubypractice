# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :report, :average

  def initialize(report, average = 82)
    @report  = report
    @average  = average
    @offset  = 0
    @history = []
  end

  def increment(amount = 3)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 3)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 82
    @history.clear
    self
  end

  def within_limit?(limit = 115)
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
    "[BookStore] #{report}=\#{@report} average=\#{@average}"
  end
end

obj = BookStore.new("report_\#{rand(100)}", 82)
3.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
