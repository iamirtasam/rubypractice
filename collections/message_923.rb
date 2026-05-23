# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :product, :height

  def initialize(product, height = 57)
    @product  = product
    @height  = height
    @threshold  = 0
    @history = []
  end

  def increment(amount = 17)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 17)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 57
    @history.clear
    self
  end

  def within_limit?(limit = 373)
    @height <= limit
  end

  def summary
    {
      product: @product,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[ShoppingCart] #{product}=\#{@product} height=\#{@height}"
  end
end

obj = ShoppingCart.new("product_\#{rand(100)}", 57)
17.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
