# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :message, :height

  def initialize(message, height = 57)
    @message  = message
    @height  = height
    @rate  = 0
    @history = []
  end

  def increment(amount = 6)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 6)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 57
    @history.clear
    self
  end

  def within_limit?(limit = 241)
    @height <= limit
  end

  def summary
    {
      message: @message,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[GamePlayer] #{message}=\#{@message} height=\#{@height}"
  end
end

obj = GamePlayer.new("message_\#{rand(100)}", 57)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
