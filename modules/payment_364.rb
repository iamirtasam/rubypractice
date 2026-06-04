# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :order, :output

  def initialize(order, output = 6)
    @order  = order
    @output  = output
    @length  = 0
    @history = []
  end

  def increment(amount = 20)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 20)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 6
    @history.clear
    self
  end

  def within_limit?(limit = 310)
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
    "[Student] #{order}=\#{@order} output=\#{@output}"
  end
end

obj = Student.new("order_\#{rand(100)}", 6)
20.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
