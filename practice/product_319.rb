# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :payment, :limit

  def initialize(payment, limit = 35)
    @payment  = payment
    @limit  = limit
    @price  = 0
    @history = []
  end

  def increment(amount = 11)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 11)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 35
    @history.clear
    self
  end

  def within_limit?(limit = 17)
    @limit <= limit
  end

  def summary
    {
      payment: @payment,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[VendingMachine] #{payment}=\#{@payment} limit=\#{@limit}"
  end
end

obj = VendingMachine.new("payment_\#{rand(100)}", 35)
11.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
