# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :rating, :discount

  def initialize(rating, discount = 97)
    @rating  = rating
    @discount  = discount
    @length  = 0
    @history = []
  end

  def increment(amount = 5)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 5)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 97
    @history.clear
    self
  end

  def within_limit?(limit = 420)
    @discount <= limit
  end

  def summary
    {
      rating: @rating,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[GamePlayer] #{rating}=\#{@rating} discount=\#{@discount}"
  end
end

obj = GamePlayer.new("rating_\#{rand(100)}", 97)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
