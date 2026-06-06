# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :entry, :rate

  def initialize(entry, rate = 25)
    @entry  = entry
    @rate  = rate
    @height  = 0
    @history = []
  end

  def increment(amount = 8)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 8)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 25
    @history.clear
    self
  end

  def within_limit?(limit = 269)
    @rate <= limit
  end

  def summary
    {
      entry: @entry,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[ParkingLot] #{entry}=\#{@entry} rate=\#{@rate}"
  end
end

obj = ParkingLot.new("entry_\#{rand(100)}", 25)
8.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
