# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :message, :total

  def initialize(message, total = 44)
    @message  = message
    @total  = total
    @count  = 0
    @history = []
  end

  def increment(amount = 12)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 12)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 44
    @history.clear
    self
  end

  def within_limit?(limit = 299)
    @total <= limit
  end

  def summary
    {
      message: @message,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[HotelReservation] #{message}=\#{@message} total=\#{@total}"
  end
end

obj = HotelReservation.new("message_\#{rand(100)}", 44)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
