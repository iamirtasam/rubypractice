# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :review, :value

  def initialize(review, value = 43)
    @review  = review
    @value  = value
    @index  = 0
    @history = []
  end

  def increment(amount = 12)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 12)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 43
    @history.clear
    self
  end

  def within_limit?(limit = 489)
    @value <= limit
  end

  def summary
    {
      review: @review,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[HotelReservation] #{review}=\#{@review} value=\#{@value}"
  end
end

obj = HotelReservation.new("review_\#{rand(100)}", 43)
12.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
