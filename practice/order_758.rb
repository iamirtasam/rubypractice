# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :payment, :rate

  def initialize(payment, rate = 12)
    @payment  = payment
    @rate  = rate
    @value  = 0
    @history = []
  end

  def increment(amount = 14)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 14)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 12
    @history.clear
    self
  end

  def within_limit?(limit = 429)
    @rate <= limit
  end

  def summary
    {
      payment: @payment,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[TodoList] #{payment}=\#{@payment} rate=\#{@rate}"
  end
end

obj = TodoList.new("payment_\#{rand(100)}", 12)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
