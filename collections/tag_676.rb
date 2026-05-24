# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :item, :rate

  def initialize(item, rate = 58)
    @item  = item
    @rate  = rate
    @average  = 0
    @history = []
  end

  def increment(amount = 16)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 16)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 58
    @history.clear
    self
  end

  def within_limit?(limit = 367)
    @rate <= limit
  end

  def summary
    {
      item: @item,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[ParkingLot] #{item}=\#{@item} rate=\#{@rate}"
  end
end

obj = ParkingLot.new("item_\#{rand(100)}", 58)
16.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
