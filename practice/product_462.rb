# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :order, :height

  def initialize(order, height = 41)
    @order  = order
    @height  = height
    @total  = 0
    @history = []
  end

  def increment(amount = 13)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 13)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 41
    @history.clear
    self
  end

  def within_limit?(limit = 146)
    @height <= limit
  end

  def summary
    {
      order: @order,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Library] #{order}=\#{@order} height=\#{@height}"
  end
end

obj = Library.new("order_\#{rand(100)}", 41)
13.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
