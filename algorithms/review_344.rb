# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :order, :ratio

  def initialize(order, ratio = 91)
    @order  = order
    @ratio  = ratio
    @median  = 0
    @history = []
  end

  def increment(amount = 1)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 1)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 91
    @history.clear
    self
  end

  def within_limit?(limit = 169)
    @ratio <= limit
  end

  def summary
    {
      order: @order,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[Calculator] #{order}=\#{@order} ratio=\#{@ratio}"
  end
end

obj = Calculator.new("order_\#{rand(100)}", 91)
1.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
