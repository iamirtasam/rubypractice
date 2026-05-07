# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :order, :output

  def initialize(order, output = 44)
    @order  = order
    @output  = output
    @width  = 0
    @history = []
  end

  def increment(amount = 1)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 1)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 44
    @history.clear
    self
  end

  def within_limit?(limit = 445)
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
    "[Calculator] #{order}=\#{@order} output=\#{@output}"
  end
end

obj = Calculator.new("order_\#{rand(100)}", 44)
1.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
