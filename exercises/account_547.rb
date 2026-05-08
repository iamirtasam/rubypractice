# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :session, :value

  def initialize(session, value = 76)
    @session  = session
    @value  = value
    @width  = 0
    @history = []
  end

  def increment(amount = 11)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 11)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 76
    @history.clear
    self
  end

  def within_limit?(limit = 294)
    @value <= limit
  end

  def summary
    {
      session: @session,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[HotelReservation] #{session}=\#{@session} value=\#{@value}"
  end
end

obj = HotelReservation.new("session_\#{rand(100)}", 76)
11.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
