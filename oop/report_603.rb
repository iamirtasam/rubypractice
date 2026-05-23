# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :rating, :threshold

  def initialize(rating, threshold = 24)
    @rating  = rating
    @threshold  = threshold
    @price  = 0
    @history = []
  end

  def increment(amount = 6)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 6)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 24
    @history.clear
    self
  end

  def within_limit?(limit = 377)
    @threshold <= limit
  end

  def summary
    {
      rating: @rating,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[HotelReservation] #{rating}=\#{@rating} threshold=\#{@threshold}"
  end
end

obj = HotelReservation.new("rating_\#{rand(100)}", 24)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
