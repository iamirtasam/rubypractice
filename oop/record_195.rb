# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :order, :output

  def initialize(order, output = 78)
    @order  = order
    @output  = output
    @value  = 0
    @history = []
  end

  def increment(amount = 9)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 9)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 78
    @history.clear
    self
  end

  def within_limit?(limit = 320)
    @output <= limit
  end

  def summary
    {
      order: @order,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[BookStore] #{order}=\#{@order} output=\#{@output}"
  end
end

obj = BookStore.new("order_\#{rand(100)}", 78)
9.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
