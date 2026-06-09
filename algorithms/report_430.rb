# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :order, :median

  def initialize(order, median = 61)
    @order  = order
    @median  = median
    @average  = 0
    @history = []
  end

  def increment(amount = 7)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 7)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 61
    @history.clear
    self
  end

  def within_limit?(limit = 26)
    @median <= limit
  end

  def summary
    {
      order: @order,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[Inventory] #{order}=\#{@order} median=\#{@median}"
  end
end

obj = Inventory.new("order_\#{rand(100)}", 61)
7.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
