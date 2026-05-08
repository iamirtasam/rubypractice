# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :item, :length

  def initialize(item, length = 89)
    @item  = item
    @length  = length
    @value  = 0
    @history = []
  end

  def increment(amount = 9)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 9)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 89
    @history.clear
    self
  end

  def within_limit?(limit = 44)
    @length <= limit
  end

  def summary
    {
      item: @item,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[TodoList] #{item}=\#{@item} length=\#{@length}"
  end
end

obj = TodoList.new("item_\#{rand(100)}", 89)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
