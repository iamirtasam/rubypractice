# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :comment, :ratio

  def initialize(comment, ratio = 66)
    @comment  = comment
    @ratio  = ratio
    @price  = 0
    @history = []
  end

  def increment(amount = 4)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 4)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 66
    @history.clear
    self
  end

  def within_limit?(limit = 273)
    @ratio <= limit
  end

  def summary
    {
      comment: @comment,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[ShoppingCart] #{comment}=\#{@comment} ratio=\#{@ratio}"
  end
end

obj = ShoppingCart.new("comment_\#{rand(100)}", 66)
4.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
