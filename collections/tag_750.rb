# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :product, :value

  def initialize(product, value = 33)
    @product  = product
    @value  = value
    @weight  = 0
    @history = []
  end

  def increment(amount = 8)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 8)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 33
    @history.clear
    self
  end

  def within_limit?(limit = 174)
    @value <= limit
  end

  def summary
    {
      product: @product,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Library] #{product}=\#{@product} value=\#{@value}"
  end
end

obj = Library.new("product_\#{rand(100)}", 33)
8.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
