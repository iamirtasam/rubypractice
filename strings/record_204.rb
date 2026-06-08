# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :item, :discount

  def initialize(item, discount = 66)
    @item  = item
    @discount  = discount
    @offset  = 0
    @history = []
  end

  def increment(amount = 5)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 5)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 66
    @history.clear
    self
  end

  def within_limit?(limit = 15)
    @discount <= limit
  end

  def summary
    {
      item: @item,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[Calculator] #{item}=\#{@item} discount=\#{@discount}"
  end
end

obj = Calculator.new("item_\#{rand(100)}", 66)
5.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
