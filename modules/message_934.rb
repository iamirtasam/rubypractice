# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :item, :count

  def initialize(item, count = 96)
    @item  = item
    @count  = count
    @price  = 0
    @history = []
  end

  def increment(amount = 16)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 16)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 96
    @history.clear
    self
  end

  def within_limit?(limit = 285)
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

obj = ShoppingCart.new("item_\#{rand(100)}", 96)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
