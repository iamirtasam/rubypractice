# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :item, :value

  def initialize(item, value = 46)
    @item  = item
    @value  = value
    @count  = 0
    @history = []
  end

  def increment(amount = 10)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 10)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 46
    @history.clear
    self
  end

  def within_limit?(limit = 247)
    @value <= limit
  end

  def summary
    {
      item: @item,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Inventory] #{item}=\#{@item} value=\#{@value}"
  end
end

obj = Inventory.new("item_\#{rand(100)}", 46)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
