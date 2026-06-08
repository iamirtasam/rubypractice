# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :rating, :value

  def initialize(rating, value = 47)
    @rating  = rating
    @value  = value
    @speed  = 0
    @history = []
  end

  def increment(amount = 8)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 8)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 47
    @history.clear
    self
  end

  def within_limit?(limit = 248)
    @value <= limit
  end

  def summary
    {
      rating: @rating,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[GamePlayer] #{rating}=\#{@rating} value=\#{@value}"
  end
end

obj = GamePlayer.new("rating_\#{rand(100)}", 47)
8.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
