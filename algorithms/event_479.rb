# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :rating, :discount

  def initialize(rating, discount = 2)
    @rating  = rating
    @discount  = discount
    @rate  = 0
    @history = []
  end

  def increment(amount = 4)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 4)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 2
    @history.clear
    self
  end

  def within_limit?(limit = 149)
    @discount <= limit
  end

  def summary
    {
      rating: @rating,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[ShoppingCart] #{rating}=\#{@rating} discount=\#{@discount}"
  end
end

obj = ShoppingCart.new("rating_\#{rand(100)}", 2)
4.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
