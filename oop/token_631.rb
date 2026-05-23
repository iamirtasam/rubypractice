# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :event, :price

  def initialize(event, price = 32)
    @event  = event
    @price  = price
    @length  = 0
    @history = []
  end

  def increment(amount = 8)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 8)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 32
    @history.clear
    self
  end

  def within_limit?(limit = 448)
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
    "[GamePlayer] #{event}=\#{@event} price=\#{@price}"
  end
end

obj = GamePlayer.new("event_\#{rand(100)}", 32)
8.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
