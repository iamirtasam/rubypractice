# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :payment, :price

  def initialize(payment, price = 24)
    @payment  = payment
    @price  = price
    @result  = 0
    @history = []
  end

  def increment(amount = 8)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 8)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 24
    @history.clear
    self
  end

  def within_limit?(limit = 470)
    @price <= limit
  end

  def summary
    {
      payment: @payment,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[FlightBooking] #{payment}=\#{@payment} price=\#{@price}"
  end
end

obj = FlightBooking.new("payment_\#{rand(100)}", 24)
8.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
