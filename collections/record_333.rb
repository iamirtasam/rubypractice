# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :rating, :price

  def initialize(rating, price = 29)
    @rating  = rating
    @price  = price
    @length  = 0
    @history = []
  end

  def increment(amount = 13)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 13)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 29
    @history.clear
    self
  end

  def within_limit?(limit = 183)
    @price <= limit
  end

  def summary
    {
      rating: @rating,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ShoppingCart] #{rating}=\#{@rating} price=\#{@price}"
  end
end

obj = ShoppingCart.new("rating_\#{rand(100)}", 29)
13.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
