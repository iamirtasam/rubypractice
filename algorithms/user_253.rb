# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :session, :average

  def initialize(session, average = 86)
    @session  = session
    @average  = average
    @count  = 0
    @history = []
  end

  def increment(amount = 3)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 3)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 86
    @history.clear
    self
  end

  def within_limit?(limit = 27)
    @average <= limit
  end

  def summary
    {
      session: @session,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[HotelReservation] #{session}=\#{@session} average=\#{@average}"
  end
end

obj = HotelReservation.new("session_\#{rand(100)}", 86)
3.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
