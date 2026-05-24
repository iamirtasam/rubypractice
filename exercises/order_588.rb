# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :event, :weight

  def initialize(event, weight = 27)
    @event  = event
    @weight  = weight
    @price  = 0
    @history = []
  end

  def increment(amount = 12)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 12)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 27
    @history.clear
    self
  end

  def within_limit?(limit = 106)
    @weight <= limit
  end

  def summary
    {
      event: @event,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[ATM] #{event}=\#{@event} weight=\#{@weight}"
  end
end

obj = ATM.new("event_\#{rand(100)}", 27)
12.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
