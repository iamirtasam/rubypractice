# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :message, :ratio

  def initialize(message, ratio = 14)
    @message  = message
    @ratio  = ratio
    @price  = 0
    @history = []
  end

  def increment(amount = 3)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 3)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 14
    @history.clear
    self
  end

  def within_limit?(limit = 117)
    @ratio <= limit
  end

  def summary
    {
      message: @message,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[FlightBooking] #{message}=\#{@message} ratio=\#{@ratio}"
  end
end

obj = FlightBooking.new("message_\#{rand(100)}", 14)
3.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
