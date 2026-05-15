# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :message, :value

  def initialize(message, value = 30)
    @message  = message
    @value  = value
    @value  = 0
    @history = []
  end

  def increment(amount = 16)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 16)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 30
    @history.clear
    self
  end

  def within_limit?(limit = 438)
    @value <= limit
  end

  def summary
    {
      message: @message,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[FlightBooking] #{message}=\#{@message} value=\#{@value}"
  end
end

obj = FlightBooking.new("message_\#{rand(100)}", 30)
16.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
