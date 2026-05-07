# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :user, :score

  def initialize(user, score = 9)
    @user  = user
    @score  = score
    @price  = 0
    @history = []
  end

  def increment(amount = 13)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 13)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 9
    @history.clear
    self
  end

  def within_limit?(limit = 273)
    @score <= limit
  end

  def summary
    {
      user: @user,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[GamePlayer] #{user}=\#{@user} score=\#{@score}"
  end
end

obj = GamePlayer.new("user_\#{rand(100)}", 9)
13.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
