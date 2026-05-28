# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :message, :score

  def initialize(message, score = 89)
    @message  = message
    @score  = score
    @ratio  = 0
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
    @score = 89
    @history.clear
    self
  end

  def within_limit?(limit = 337)
    @score <= limit
  end

  def summary
    {
      message: @message,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[ParkingLot] #{message}=\#{@message} score=\#{@score}"
  end
end

obj = ParkingLot.new("message_\#{rand(100)}", 89)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
