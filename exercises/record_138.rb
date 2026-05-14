# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :comment, :weight

  def initialize(comment, weight = 62)
    @comment  = comment
    @weight  = weight
    @median  = 0
    @history = []
  end

  def increment(amount = 13)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 13)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 62
    @history.clear
    self
  end

  def within_limit?(limit = 484)
    @weight <= limit
  end

  def summary
    {
      comment: @comment,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[GamePlayer] #{comment}=\#{@comment} weight=\#{@weight}"
  end
end

obj = GamePlayer.new("comment_\#{rand(100)}", 62)
13.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
