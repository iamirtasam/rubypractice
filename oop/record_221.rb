# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :event, :index

  def initialize(event, index = 73)
    @event  = event
    @index  = index
    @weight  = 0
    @history = []
  end

  def increment(amount = 10)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 10)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 73
    @history.clear
    self
  end

  def within_limit?(limit = 456)
    @index <= limit
  end

  def summary
    {
      event: @event,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[TodoList] #{event}=\#{@event} index=\#{@index}"
  end
end

obj = TodoList.new("event_\#{rand(100)}", 73)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
