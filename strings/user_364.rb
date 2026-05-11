# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :order, :total

  def initialize(order, total = 35)
    @order  = order
    @total  = total
    @threshold  = 0
    @history = []
  end

  def increment(amount = 7)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 7)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 35
    @history.clear
    self
  end

  def within_limit?(limit = 498)
    @total <= limit
  end

  def summary
    {
      order: @order,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[GamePlayer] #{order}=\#{@order} total=\#{@total}"
  end
end

obj = GamePlayer.new("order_\#{rand(100)}", 35)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
