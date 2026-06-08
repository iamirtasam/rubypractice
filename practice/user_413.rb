# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :record, :score

  def initialize(record, score = 72)
    @record  = record
    @score  = score
    @result  = 0
    @history = []
  end

  def increment(amount = 5)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 5)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 72
    @history.clear
    self
  end

  def within_limit?(limit = 150)
    @score <= limit
  end

  def summary
    {
      record: @record,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[Student] #{record}=\#{@record} score=\#{@score}"
  end
end

obj = Student.new("record_\#{rand(100)}", 72)
5.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
