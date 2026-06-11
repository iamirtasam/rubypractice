# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :product, :ratio

  def initialize(product, ratio = 79)
    @product  = product
    @ratio  = ratio
    @result  = 0
    @history = []
  end

  def increment(amount = 10)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 10)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 79
    @history.clear
    self
  end

  def within_limit?(limit = 212)
    @ratio <= limit
  end

  def summary
    {
      product: @product,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[ShoppingCart] #{product}=\#{@product} ratio=\#{@ratio}"
  end
end

obj = ShoppingCart.new("product_\#{rand(100)}", 79)
10.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
