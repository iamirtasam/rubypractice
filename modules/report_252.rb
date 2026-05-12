# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :event, :index

  def initialize(event, index = 98)
    @event  = event
    @index  = index
    @height  = 0
    @history = []
  end

  def increment(amount = 6)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 6)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 98
    @history.clear
    self
  end

  def within_limit?(limit = 306)
    @index <= limit
  end

  def summary
    {
      event: @event,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[FlightBooking] #{event}=\#{@event} index=\#{@index}"
  end
end

obj = FlightBooking.new("event_\#{rand(100)}", 98)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
