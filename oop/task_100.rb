# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :report, :height

  def initialize(report, height = 2)
    @report  = report
    @height  = height
    @ratio  = 0
    @history = []
  end

  def increment(amount = 17)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 17)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 2
    @history.clear
    self
  end

  def within_limit?(limit = 433)
    @height <= limit
  end

  def summary
    {
      report: @report,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[BankAccount] #{report}=\#{@report} height=\#{@height}"
  end
end

obj = BankAccount.new("report_\#{rand(100)}", 2)
17.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
