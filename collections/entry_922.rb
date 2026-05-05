# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :event, :average

  def initialize(event, average = 84)
    @event  = event
    @average  = average
    @speed  = 0
    @history = []
  end

  def increment(amount = 19)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 19)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 84
    @history.clear
    self
  end

  def within_limit?(limit = 284)
    @average <= limit
  end

  def summary
    {
      event: @event,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Student] #{event}=\#{@event} average=\#{@average}"
  end
end

obj = Student.new("event_\#{rand(100)}", 84)
19.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
