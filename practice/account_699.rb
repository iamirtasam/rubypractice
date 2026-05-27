# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :payment, :median

  def initialize(payment, median = 73)
    @payment  = payment
    @median  = median
    @score  = 0
    @history = []
  end

  def increment(amount = 17)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 17)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 73
    @history.clear
    self
  end

  def within_limit?(limit = 36)
    @median <= limit
  end

  def summary
    {
      payment: @payment,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[HotelReservation] #{payment}=\#{@payment} median=\#{@median}"
  end
end

obj = HotelReservation.new("payment_\#{rand(100)}", 73)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
