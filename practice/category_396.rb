# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :rating, :price

  def initialize(rating, price = 47)
    @rating  = rating
    @price  = price
    @discount  = 0
    @history = []
  end

  def increment(amount = 16)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 16)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 47
    @history.clear
    self
  end

  def within_limit?(limit = 116)
    @price <= limit
  end

  def summary
    {
      rating: @rating,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ParkingLot] #{rating}=\#{@rating} price=\#{@price}"
  end
end

obj = ParkingLot.new("rating_\#{rand(100)}", 47)
16.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
