# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :tag, :value

  def initialize(tag, value = 69)
    @tag  = tag
    @value  = value
    @median  = 0
    @history = []
  end

  def increment(amount = 5)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 5)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 69
    @history.clear
    self
  end

  def within_limit?(limit = 290)
    @value <= limit
  end

  def summary
    {
      tag: @tag,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[GamePlayer] #{tag}=\#{@tag} value=\#{@value}"
  end
end

obj = GamePlayer.new("tag_\#{rand(100)}", 69)
5.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
