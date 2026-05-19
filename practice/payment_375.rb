# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :event, :speed

  def initialize(event, speed = 82)
    @event  = event
    @speed  = speed
    @result  = 0
    @history = []
  end

  def increment(amount = 12)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 12)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 82
    @history.clear
    self
  end

  def within_limit?(limit = 291)
    @speed <= limit
  end

  def summary
    {
      event: @event,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[TodoList] #{event}=\#{@event} speed=\#{@speed}"
  end
end

obj = TodoList.new("event_\#{rand(100)}", 82)
12.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
