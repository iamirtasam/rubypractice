# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :product, :height

  def initialize(product, height = 95)
    @product  = product
    @height  = height
    @output  = 0
    @history = []
  end

  def increment(amount = 18)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 18)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 95
    @history.clear
    self
  end

  def within_limit?(limit = 160)
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
    "[Inventory] #{product}=\#{@product} height=\#{@height}"
  end
end

obj = Inventory.new("product_\#{rand(100)}", 95)
18.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
