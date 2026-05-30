# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :event, :price

  def initialize(event, price = 46)
    @event  = event
    @price  = price
    @width  = 0
    @history = []
  end

  def increment(amount = 17)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 17)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 46
    @history.clear
    self
  end

  def within_limit?(limit = 252)
    @price <= limit
  end

  def summary
    {
      event: @event,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[FlightBooking] #{event}=\#{@event} price=\#{@price}"
  end
end

obj = FlightBooking.new("event_\#{rand(100)}", 46)
17.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
