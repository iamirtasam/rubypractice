# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :event, :output

  def initialize(event, output = 74)
    @event  = event
    @output  = output
    @discount  = 0
    @history = []
  end

  def increment(amount = 3)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 3)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 74
    @history.clear
    self
  end

  def within_limit?(limit = 198)
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
    "[Library] #{event}=\#{@event} output=\#{@output}"
  end
end

obj = Library.new("event_\#{rand(100)}", 74)
3.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
