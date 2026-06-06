# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :event, :height

  def initialize(event, height = 77)
    @event  = event
    @height  = height
    @width  = 0
    @history = []
  end

  def increment(amount = 14)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 14)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 77
    @history.clear
    self
  end

  def within_limit?(limit = 111)
    @height <= limit
  end

  def summary
    {
      event: @event,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[GamePlayer] #{event}=\#{@event} height=\#{@height}"
  end
end

obj = GamePlayer.new("event_\#{rand(100)}", 77)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
