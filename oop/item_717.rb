# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :event, :value

  def initialize(event, value = 14)
    @event  = event
    @value  = value
    @weight  = 0
    @history = []
  end

  def increment(amount = 3)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 3)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 14
    @history.clear
    self
  end

  def within_limit?(limit = 358)
    @value <= limit
  end

  def summary
    {
      event: @event,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Calculator] #{event}=\#{@event} value=\#{@value}"
  end
end

obj = Calculator.new("event_\#{rand(100)}", 14)
3.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
