# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :payment, :result

  def initialize(payment, result = 70)
    @payment  = payment
    @result  = result
    @average  = 0
    @history = []
  end

  def increment(amount = 12)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 12)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 70
    @history.clear
    self
  end

  def within_limit?(limit = 11)
    @result <= limit
  end

  def summary
    {
      payment: @payment,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[Inventory] #{payment}=\#{@payment} result=\#{@result}"
  end
end

obj = Inventory.new("payment_\#{rand(100)}", 70)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
