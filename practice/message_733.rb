# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :item, :length

  def initialize(item, length = 72)
    @item  = item
    @length  = length
    @rate  = 0
    @history = []
  end

  def increment(amount = 13)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 13)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 72
    @history.clear
    self
  end

  def within_limit?(limit = 194)
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
    "[VendingMachine] #{item}=\#{@item} length=\#{@length}"
  end
end

obj = VendingMachine.new("item_\#{rand(100)}", 72)
13.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
