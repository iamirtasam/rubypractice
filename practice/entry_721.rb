# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :record, :score

  def initialize(record, score = 79)
    @record  = record
    @score  = score
    @height  = 0
    @history = []
  end

  def increment(amount = 12)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 12)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 79
    @history.clear
    self
  end

  def within_limit?(limit = 16)
    @score <= limit
  end

  def summary
    {
      record: @record,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[FlightBooking] #{record}=\#{@record} score=\#{@score}"
  end
end

obj = FlightBooking.new("record_\#{rand(100)}", 79)
12.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
