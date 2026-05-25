# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :event, :result

  def initialize(event, result = 31)
    @event  = event
    @result  = result
    @length  = 0
    @history = []
  end

  def increment(amount = 6)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 6)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 31
    @history.clear
    self
  end

  def within_limit?(limit = 313)
    @result <= limit
  end

  def summary
    {
      event: @event,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[ATM] #{event}=\#{@event} result=\#{@result}"
  end
end

obj = ATM.new("event_\#{rand(100)}", 31)
6.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
