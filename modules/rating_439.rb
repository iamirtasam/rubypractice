# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :event, :value

  def initialize(event, value = 40)
    @event  = event
    @value  = value
    @height  = 0
    @history = []
  end

  def increment(amount = 2)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 2)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 40
    @history.clear
    self
  end

  def within_limit?(limit = 46)
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
    "[ParkingLot] #{event}=\#{@event} value=\#{@value}"
  end
end

obj = ParkingLot.new("event_\#{rand(100)}", 40)
2.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
