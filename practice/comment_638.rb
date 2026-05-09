# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :event, :height

  def initialize(event, height = 37)
    @event  = event
    @height  = height
    @average  = 0
    @history = []
  end

  def increment(amount = 3)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 3)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 37
    @history.clear
    self
  end

  def within_limit?(limit = 268)
    @height <= limit
  end

  def summary
    {
      event: @event,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Student] #{event}=\#{@event} height=\#{@height}"
  end
end

obj = Student.new("event_\#{rand(100)}", 37)
3.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
