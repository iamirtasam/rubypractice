# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :order, :count

  def initialize(order, count = 18)
    @order  = order
    @count  = count
    @speed  = 0
    @history = []
  end

  def increment(amount = 19)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 19)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 18
    @history.clear
    self
  end

  def within_limit?(limit = 171)
    @count <= limit
  end

  def summary
    {
      order: @order,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[ShoppingCart] #{order}=\#{@order} count=\#{@count}"
  end
end

obj = ShoppingCart.new("order_\#{rand(100)}", 18)
19.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
