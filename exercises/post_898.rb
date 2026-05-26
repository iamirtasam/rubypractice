# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :event, :limit

  def initialize(event, limit = 24)
    @event  = event
    @limit  = limit
    @weight  = 0
    @history = []
  end

  def increment(amount = 12)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 12)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 24
    @history.clear
    self
  end

  def within_limit?(limit = 114)
    @limit <= limit
  end

  def summary
    {
      event: @event,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[TodoList] #{event}=\#{@event} limit=\#{@limit}"
  end
end

obj = TodoList.new("event_\#{rand(100)}", 24)
12.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
