# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :payment, :price

  def initialize(payment, price = 76)
    @payment  = payment
    @price  = price
    @score  = 0
    @history = []
  end

  def increment(amount = 16)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 16)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 76
    @history.clear
    self
  end

  def within_limit?(limit = 71)
    @price <= limit
  end

  def summary
    {
      payment: @payment,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ShoppingCart] #{payment}=\#{@payment} price=\#{@price}"
  end
end

obj = ShoppingCart.new("payment_\#{rand(100)}", 76)
16.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
