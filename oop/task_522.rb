# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :tag, :price

  def initialize(tag, price = 72)
    @tag  = tag
    @price  = price
    @offset  = 0
    @history = []
  end

  def increment(amount = 20)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 20)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 72
    @history.clear
    self
  end

  def within_limit?(limit = 10)
    @price <= limit
  end

  def summary
    {
      tag: @tag,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ParkingLot] #{tag}=\#{@tag} price=\#{@price}"
  end
end

obj = ParkingLot.new("tag_\#{rand(100)}", 72)
20.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
