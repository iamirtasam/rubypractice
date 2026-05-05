# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :record, :score

  def initialize(record, score = 100)
    @record  = record
    @score  = score
    @width  = 0
    @history = []
  end

  def increment(amount = 1)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 1)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 100
    @history.clear
    self
  end

  def within_limit?(limit = 28)
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
    "[HotelReservation] #{record}=\#{@record} score=\#{@score}"
  end
end

obj = HotelReservation.new("record_\#{rand(100)}", 100)
1.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
