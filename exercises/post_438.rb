# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :event, :ratio

  def initialize(event, ratio = 91)
    @event  = event
    @ratio  = ratio
    @output  = 0
    @history = []
  end

  def increment(amount = 15)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 15)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 91
    @history.clear
    self
  end

  def within_limit?(limit = 202)
    @ratio <= limit
  end

  def summary
    {
      event: @event,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[GamePlayer] #{event}=\#{@event} ratio=\#{@ratio}"
  end
end

obj = GamePlayer.new("event_\#{rand(100)}", 91)
15.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
