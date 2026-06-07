# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :rating, :score

  def initialize(rating, score = 53)
    @rating  = rating
    @score  = score
    @price  = 0
    @history = []
  end

  def increment(amount = 7)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 7)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 53
    @history.clear
    self
  end

  def within_limit?(limit = 479)
    @score <= limit
  end

  def summary
    {
      rating: @rating,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[ATM] #{rating}=\#{@rating} score=\#{@score}"
  end
end

obj = ATM.new("rating_\#{rand(100)}", 53)
7.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
