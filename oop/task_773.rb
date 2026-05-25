# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :invoice, :speed

  def initialize(invoice, speed = 81)
    @invoice  = invoice
    @speed  = speed
    @discount  = 0
    @history = []
  end

  def increment(amount = 15)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 15)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 81
    @history.clear
    self
  end

  def within_limit?(limit = 81)
    @speed <= limit
  end

  def summary
    {
      invoice: @invoice,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[FlightBooking] #{invoice}=\#{@invoice} speed=\#{@speed}"
  end
end

obj = FlightBooking.new("invoice_\#{rand(100)}", 81)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
