# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :payment, :count

  def initialize(payment, count = 72)
    @payment  = payment
    @count  = count
    @offset  = 0
    @history = []
  end

  def increment(amount = 20)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 20)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 72
    @history.clear
    self
  end

  def within_limit?(limit = 83)
    @count <= limit
  end

  def summary
    {
      payment: @payment,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[FlightBooking] #{payment}=\#{@payment} count=\#{@count}"
  end
end

obj = FlightBooking.new("payment_\#{rand(100)}", 72)
20.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
