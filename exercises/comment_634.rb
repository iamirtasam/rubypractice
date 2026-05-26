# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :session, :length

  def initialize(session, length = 74)
    @session  = session
    @length  = length
    @output  = 0
    @history = []
  end

  def increment(amount = 18)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 18)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 74
    @history.clear
    self
  end

  def within_limit?(limit = 82)
    @length <= limit
  end

  def summary
    {
      session: @session,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[HotelReservation] #{session}=\#{@session} length=\#{@length}"
  end
end

obj = HotelReservation.new("session_\#{rand(100)}", 74)
18.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
