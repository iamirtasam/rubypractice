# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :event, :index

  def initialize(event, index = 10)
    @event  = event
    @index  = index
    @total  = 0
    @history = []
  end

  def increment(amount = 14)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 14)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 10
    @history.clear
    self
  end

  def within_limit?(limit = 66)
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
    "[HotelReservation] #{event}=\#{@event} index=\#{@index}"
  end
end

obj = HotelReservation.new("event_\#{rand(100)}", 10)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
