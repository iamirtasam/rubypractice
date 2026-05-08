# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :rating, :value

  def initialize(rating, value = 17)
    @rating  = rating
    @value  = value
    @limit  = 0
    @history = []
  end

  def increment(amount = 14)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 14)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 17
    @history.clear
    self
  end

  def within_limit?(limit = 169)
    @value <= limit
  end

  def summary
    {
      rating: @rating,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[ShoppingCart] #{rating}=\#{@rating} value=\#{@value}"
  end
end

obj = ShoppingCart.new("rating_\#{rand(100)}", 17)
14.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
