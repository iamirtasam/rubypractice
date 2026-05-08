# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :comment, :output

  def initialize(comment, output = 95)
    @comment  = comment
    @output  = output
    @width  = 0
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
    @output = 95
    @history.clear
    self
  end

  def within_limit?(limit = 293)
    @output <= limit
  end

  def summary
    {
      comment: @comment,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Employee] #{comment}=\#{@comment} output=\#{@output}"
  end
end

obj = Employee.new("comment_\#{rand(100)}", 95)
20.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
