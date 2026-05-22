# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :review, :height

  def initialize(review, height = 87)
    @review  = review
    @height  = height
    @median  = 0
    @history = []
  end

  def increment(amount = 20)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 20)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 87
    @history.clear
    self
  end

  def within_limit?(limit = 86)
    @height <= limit
  end

  def summary
    {
      review: @review,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Calculator] #{review}=\#{@review} height=\#{@height}"
  end
end

obj = Calculator.new("review_\#{rand(100)}", 87)
20.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
