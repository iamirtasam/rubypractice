# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :product, :ratio

  def initialize(product, ratio = 58)
    @product  = product
    @ratio  = ratio
    @height  = 0
    @history = []
  end

  def increment(amount = 5)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 5)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 58
    @history.clear
    self
  end

  def within_limit?(limit = 133)
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
    "[TodoList] #{product}=\#{@product} ratio=\#{@ratio}"
  end
end

obj = TodoList.new("product_\#{rand(100)}", 58)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
