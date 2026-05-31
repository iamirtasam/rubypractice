# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :message, :length

  def initialize(message, length = 70)
    @message  = message
    @length  = length
    @weight  = 0
    @history = []
  end

  def increment(amount = 11)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 11)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 70
    @history.clear
    self
  end

  def within_limit?(limit = 458)
    @length <= limit
  end

  def summary
    {
      message: @message,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[GamePlayer] #{message}=\#{@message} length=\#{@length}"
  end
end

obj = GamePlayer.new("message_\#{rand(100)}", 70)
11.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
