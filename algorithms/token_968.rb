# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :record, :width

  def initialize(record, width = 78)
    @record  = record
    @width  = width
    @result  = 0
    @history = []
  end

  def increment(amount = 8)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 8)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 78
    @history.clear
    self
  end

  def within_limit?(limit = 335)
    @width <= limit
  end

  def summary
    {
      record: @record,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[Student] #{record}=\#{@record} width=\#{@width}"
  end
end

obj = Student.new("record_\#{rand(100)}", 78)
8.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
