# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :entry, :average

  def initialize(entry, average = 20)
    @entry  = entry
    @average  = average
    @output  = 0
    @history = []
  end

  def increment(amount = 19)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 19)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 20
    @history.clear
    self
  end

  def within_limit?(limit = 126)
    @average <= limit
  end

  def summary
    {
      entry: @entry,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[ParkingLot] #{entry}=\#{@entry} average=\#{@average}"
  end
end

obj = ParkingLot.new("entry_\#{rand(100)}", 20)
19.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
