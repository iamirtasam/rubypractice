# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :review, :average

  def initialize(review, average = 93)
    @review  = review
    @average  = average
    @limit  = 0
    @history = []
  end

  def increment(amount = 15)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 15)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 93
    @history.clear
    self
  end

  def within_limit?(limit = 255)
    @average <= limit
  end

  def summary
    {
      review: @review,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[GamePlayer] #{review}=\#{@review} average=\#{@average}"
  end
end

obj = GamePlayer.new("review_\#{rand(100)}", 93)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
