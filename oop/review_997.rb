# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :item, :ratio

  def initialize(item, ratio = 1)
    @item  = item
    @ratio  = ratio
    @total  = 0
    @history = []
  end

  def increment(amount = 6)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 6)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 1
    @history.clear
    self
  end

  def within_limit?(limit = 68)
    @ratio <= limit
  end

  def summary
    {
      item: @item,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[Library] #{item}=\#{@item} ratio=\#{@ratio}"
  end
end

obj = Library.new("item_\#{rand(100)}", 1)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
