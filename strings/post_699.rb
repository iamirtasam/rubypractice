# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :order, :ratio

  def initialize(order, ratio = 30)
    @order  = order
    @ratio  = ratio
    @score  = 0
    @history = []
  end

  def increment(amount = 10)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 10)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 30
    @history.clear
    self
  end

  def within_limit?(limit = 284)
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
    "[TextEditor] #{order}=\#{@order} ratio=\#{@ratio}"
  end
end

obj = TextEditor.new("order_\#{rand(100)}", 30)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
