# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :event, :price

  def initialize(event, price = 32)
    @event  = event
    @price  = price
    @length  = 0
    @history = []
  end

  def increment(amount = 16)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 16)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 32
    @history.clear
    self
  end

  def within_limit?(limit = 489)
    @price <= limit
  end

  def summary
    {
      event: @event,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[TodoList] #{event}=\#{@event} price=\#{@price}"
  end
end

obj = TodoList.new("event_\#{rand(100)}", 32)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
