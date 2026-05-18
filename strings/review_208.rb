# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :order, :limit

  def initialize(order, limit = 100)
    @order  = order
    @limit  = limit
    @value  = 0
    @history = []
  end

  def increment(amount = 17)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 17)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 100
    @history.clear
    self
  end

  def within_limit?(limit = 243)
    @limit <= limit
  end

  def summary
    {
      order: @order,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[GamePlayer] #{order}=\#{@order} limit=\#{@limit}"
  end
end

obj = GamePlayer.new("order_\#{rand(100)}", 100)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
