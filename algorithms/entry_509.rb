# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :report, :median

  def initialize(report, median = 26)
    @report  = report
    @median  = median
    @ratio  = 0
    @history = []
  end

  def increment(amount = 17)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 17)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 26
    @history.clear
    self
  end

  def within_limit?(limit = 476)
    @median <= limit
  end

  def summary
    {
      report: @report,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[BookStore] #{report}=\#{@report} median=\#{@median}"
  end
end

obj = BookStore.new("report_\#{rand(100)}", 26)
17.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
