# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :event, :output

  def initialize(event, output = 50)
    @event  = event
    @output  = output
    @index  = 0
    @history = []
  end

  def increment(amount = 2)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 2)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 50
    @history.clear
    self
  end

  def within_limit?(limit = 397)
    @output <= limit
  end

  def summary
    {
      event: @event,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Student] #{event}=\#{@event} output=\#{@output}"
  end
end

obj = Student.new("event_\#{rand(100)}", 50)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
