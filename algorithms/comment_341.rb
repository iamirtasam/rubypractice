# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :product, :index

  def initialize(product, index = 85)
    @product  = product
    @index  = index
    @weight  = 0
    @history = []
  end

  def increment(amount = 4)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 4)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 85
    @history.clear
    self
  end

  def within_limit?(limit = 454)
    @index <= limit
  end

  def summary
    {
      product: @product,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[ShoppingCart] #{product}=\#{@product} index=\#{@index}"
  end
end

obj = ShoppingCart.new("product_\#{rand(100)}", 85)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
