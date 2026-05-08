# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :comment, :count

  def initialize(comment, count = 93)
    @comment  = comment
    @count  = count
    @height  = 0
    @history = []
  end

  def increment(amount = 4)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 4)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 93
    @history.clear
    self
  end

  def within_limit?(limit = 384)
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
    "[Student] #{comment}=\#{@comment} count=\#{@count}"
  end
end

obj = Student.new("comment_\#{rand(100)}", 93)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
