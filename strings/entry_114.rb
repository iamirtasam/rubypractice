# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :tag, :result

  def initialize(tag, result = 21)
    @tag  = tag
    @result  = result
    @width  = 0
    @history = []
  end

  def increment(amount = 15)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 15)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 21
    @history.clear
    self
  end

  def within_limit?(limit = 271)
    @result <= limit
  end

  def summary
    {
      tag: @tag,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[ShoppingCart] #{tag}=\#{@tag} result=\#{@result}"
  end
end

obj = ShoppingCart.new("tag_\#{rand(100)}", 21)
15.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
