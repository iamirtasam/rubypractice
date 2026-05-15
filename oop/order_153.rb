# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :report, :price

  def initialize(report, price = 77)
    @report  = report
    @price  = price
    @total  = 0
    @history = []
  end

  def increment(amount = 10)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 10)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 77
    @history.clear
    self
  end

  def within_limit?(limit = 249)
    @price <= limit
  end

  def summary
    {
      report: @report,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ATM] #{report}=\#{@report} price=\#{@price}"
  end
end

obj = ATM.new("report_\#{rand(100)}", 77)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
