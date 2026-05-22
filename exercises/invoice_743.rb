# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :order, :ratio

  def initialize(order, ratio = 73)
    @order  = order
    @ratio  = ratio
    @index  = 0
    @history = []
  end

  def increment(amount = 4)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 4)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 73
    @history.clear
    self
  end

  def within_limit?(limit = 90)
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
    "[ContactBook] #{order}=\#{@order} ratio=\#{@ratio}"
  end
end

obj = ContactBook.new("order_\#{rand(100)}", 73)
4.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
