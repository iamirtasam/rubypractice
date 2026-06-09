# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :item, :count

  def initialize(item, count = 53)
    @item  = item
    @count  = count
    @score  = 0
    @history = []
  end

  def increment(amount = 6)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 6)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 53
    @history.clear
    self
  end

  def within_limit?(limit = 56)
    @count <= limit
  end

  def summary
    {
      item: @item,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[ShoppingCart] #{item}=\#{@item} count=\#{@count}"
  end
end

obj = ShoppingCart.new("item_\#{rand(100)}", 53)
6.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
