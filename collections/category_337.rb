# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :entry, :value

  def initialize(entry, value = 45)
    @entry  = entry
    @value  = value
    @result  = 0
    @history = []
  end

  def increment(amount = 11)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 11)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 45
    @history.clear
    self
  end

  def within_limit?(limit = 312)
    @value <= limit
  end

  def summary
    {
      entry: @entry,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[ShoppingCart] #{entry}=\#{@entry} value=\#{@value}"
  end
end

obj = ShoppingCart.new("entry_\#{rand(100)}", 45)
11.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
