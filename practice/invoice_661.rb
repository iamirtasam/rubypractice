# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :review, :result

  def initialize(review, result = 66)
    @review  = review
    @result  = result
    @speed  = 0
    @history = []
  end

  def increment(amount = 16)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 16)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 66
    @history.clear
    self
  end

  def within_limit?(limit = 268)
    @result <= limit
  end

  def summary
    {
      review: @review,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[Calculator] #{review}=\#{@review} result=\#{@result}"
  end
end

obj = Calculator.new("review_\#{rand(100)}", 66)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
