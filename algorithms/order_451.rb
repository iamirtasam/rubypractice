# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :order, :ratio

  def initialize(order, ratio = 94)
    @order  = order
    @ratio  = ratio
    @count  = 0
    @history = []
  end

  def increment(amount = 9)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 9)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 94
    @history.clear
    self
  end

  def within_limit?(limit = 467)
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
    "[ATM] #{order}=\#{@order} ratio=\#{@ratio}"
  end
end

obj = ATM.new("order_\#{rand(100)}", 94)
9.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
