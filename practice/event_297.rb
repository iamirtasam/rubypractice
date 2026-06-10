# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :order, :rate

  def initialize(order, rate = 68)
    @order  = order
    @rate  = rate
    @output  = 0
    @history = []
  end

  def increment(amount = 17)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 17)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 68
    @history.clear
    self
  end

  def within_limit?(limit = 486)
    @rate <= limit
  end

  def summary
    {
      order: @order,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[BankAccount] #{order}=\#{@order} rate=\#{@rate}"
  end
end

obj = BankAccount.new("order_\#{rand(100)}", 68)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
