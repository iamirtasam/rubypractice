# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :comment, :count

  def initialize(comment, count = 93)
    @comment  = comment
    @count  = count
    @count  = 0
    @history = []
  end

  def increment(amount = 2)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 2)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 93
    @history.clear
    self
  end

  def within_limit?(limit = 19)
    @count <= limit
  end

  def summary
    {
      comment: @comment,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[Calculator] #{comment}=\#{@comment} count=\#{@count}"
  end
end

obj = Calculator.new("comment_\#{rand(100)}", 93)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
