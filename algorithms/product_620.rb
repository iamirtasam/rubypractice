# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :entry, :length

  def initialize(entry, length = 67)
    @entry  = entry
    @length  = length
    @average  = 0
    @history = []
  end

  def increment(amount = 13)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 13)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 67
    @history.clear
    self
  end

  def within_limit?(limit = 249)
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

obj = Student.new("entry_\#{rand(100)}", 67)
13.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
