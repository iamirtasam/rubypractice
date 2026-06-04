# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :entry, :length

  def initialize(entry, length = 49)
    @entry  = entry
    @length  = length
    @index  = 0
    @history = []
  end

  def increment(amount = 7)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 7)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 49
    @history.clear
    self
  end

  def within_limit?(limit = 334)
    @length <= limit
  end

  def summary
    {
      entry: @entry,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[Student] #{entry}=\#{@entry} length=\#{@length}"
  end
end

obj = Student.new("entry_\#{rand(100)}", 49)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
