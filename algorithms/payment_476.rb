# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :review, :average

  def initialize(review, average = 56)
    @review  = review
    @average  = average
    @threshold  = 0
    @history = []
  end

  def increment(amount = 16)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 16)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 56
    @history.clear
    self
  end

  def within_limit?(limit = 201)
    @average <= limit
  end

  def summary
    {
      review: @review,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Calculator] #{review}=\#{@review} average=\#{@average}"
  end
end

obj = Calculator.new("review_\#{rand(100)}", 56)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
