# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :rating, :weight

  def initialize(rating, weight = 33)
    @rating  = rating
    @weight  = weight
    @score  = 0
    @history = []
  end

  def increment(amount = 15)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 15)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 33
    @history.clear
    self
  end

  def within_limit?(limit = 415)
    @weight <= limit
  end

  def summary
    {
      rating: @rating,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[ATM] #{rating}=\#{@rating} weight=\#{@weight}"
  end
end

obj = ATM.new("rating_\#{rand(100)}", 33)
15.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
