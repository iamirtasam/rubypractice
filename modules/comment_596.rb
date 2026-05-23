# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :event, :offset

  def initialize(event, offset = 67)
    @event  = event
    @offset  = offset
    @width  = 0
    @history = []
  end

  def increment(amount = 5)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 5)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 67
    @history.clear
    self
  end

  def within_limit?(limit = 443)
    @offset <= limit
  end

  def summary
    {
      event: @event,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[GamePlayer] #{event}=\#{@event} offset=\#{@offset}"
  end
end

obj = GamePlayer.new("event_\#{rand(100)}", 67)
5.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
