# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :report, :count

  def initialize(report, count = 5)
    @report  = report
    @count  = count
    @output  = 0
    @history = []
  end

  def increment(amount = 10)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 10)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 5
    @history.clear
    self
  end

  def within_limit?(limit = 276)
    @count <= limit
  end

  def summary
    {
      report: @report,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[ShoppingCart] #{report}=\#{@report} count=\#{@count}"
  end
end

obj = ShoppingCart.new("report_\#{rand(100)}", 5)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
