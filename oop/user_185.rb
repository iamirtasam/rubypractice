# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :token, :length

  def initialize(token, length = 8)
    @token  = token
    @length  = length
    @median  = 0
    @history = []
  end

  def increment(amount = 9)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 9)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 8
    @history.clear
    self
  end

  def within_limit?(limit = 314)
    @length <= limit
  end

  def summary
    {
      token: @token,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[GamePlayer] #{token}=\#{@token} length=\#{@length}"
  end
end

obj = GamePlayer.new("token_\#{rand(100)}", 8)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
