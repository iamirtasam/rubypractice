# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :order, :discount

  def initialize(order, discount = 39)
    @order  = order
    @discount  = discount
    @index  = 0
    @history = []
  end

  def increment(amount = 5)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 5)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 39
    @history.clear
    self
  end

  def within_limit?(limit = 13)
    @discount <= limit
  end

  def summary
    {
      order: @order,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[BankAccount] #{order}=\#{@order} discount=\#{@discount}"
  end
end

obj = BankAccount.new("order_\#{rand(100)}", 39)
5.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
