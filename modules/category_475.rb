# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :order, :limit

  def initialize(order, limit = 53)
    @order  = order
    @limit  = limit
    @length  = 0
    @history = []
  end

  def increment(amount = 11)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 11)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 53
    @history.clear
    self
  end

  def within_limit?(limit = 182)
    @limit <= limit
  end

  def summary
    {
      order: @order,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Library] #{order}=\#{@order} limit=\#{@limit}"
  end
end

obj = Library.new("order_\#{rand(100)}", 53)
11.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
