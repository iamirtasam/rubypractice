# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :review, :output

  def initialize(review, output = 19)
    @review  = review
    @output  = output
    @result  = 0
    @history = []
  end

  def increment(amount = 15)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 15)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 19
    @history.clear
    self
  end

  def within_limit?(limit = 88)
    @output <= limit
  end

  def summary
    {
      review: @review,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Student] #{review}=\#{@review} output=\#{@output}"
  end
end

obj = Student.new("review_\#{rand(100)}", 19)
15.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
