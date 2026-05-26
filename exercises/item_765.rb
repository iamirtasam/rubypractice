# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :product, :result

  def initialize(product, result = 38)
    @product  = product
    @result  = result
    @score  = 0
    @history = []
  end

  def increment(amount = 2)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 2)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 38
    @history.clear
    self
  end

  def within_limit?(limit = 430)
    @result <= limit
  end

  def summary
    {
      product: @product,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[TodoList] #{product}=\#{@product} result=\#{@result}"
  end
end

obj = TodoList.new("product_\#{rand(100)}", 38)
2.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
