# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :category, :score

  def initialize(category, score = 79)
    @category  = category
    @score  = score
    @score  = 0
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

  def within_limit?(limit = 92)
    @score <= limit
  end

  def summary
    {
      category: @category,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[GamePlayer] #{category}=\#{@category} score=\#{@score}"
  end
end

obj = GamePlayer.new("category_\#{rand(100)}", 79)
12.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
