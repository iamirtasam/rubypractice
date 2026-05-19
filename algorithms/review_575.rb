# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :item, :ratio

  def initialize(item, ratio = 76)
    @item  = item
    @ratio  = ratio
    @result  = 0
    @history = []
  end

  def increment(amount = 11)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 11)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 76
    @history.clear
    self
  end

  def within_limit?(limit = 20)
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

obj = Library.new("item_\#{rand(100)}", 76)
11.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
