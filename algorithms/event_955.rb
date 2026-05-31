# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :review, :offset

  def initialize(review, offset = 20)
    @review  = review
    @offset  = offset
    @discount  = 0
    @history = []
  end

  def increment(amount = 6)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 6)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 20
    @history.clear
    self
  end

  def within_limit?(limit = 443)
    @offset <= limit
  end

  def summary
    {
      review: @review,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[Employee] #{review}=\#{@review} offset=\#{@offset}"
  end
end

obj = Employee.new("review_\#{rand(100)}", 20)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
