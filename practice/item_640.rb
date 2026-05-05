# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :item, :threshold

  def initialize(item, threshold = 98)
    @item  = item
    @threshold  = threshold
    @median  = 0
    @history = []
  end

  def increment(amount = 4)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 4)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 98
    @history.clear
    self
  end

  def within_limit?(limit = 376)
    @threshold <= limit
  end

  def summary
    {
      item: @item,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[GamePlayer] #{item}=\#{@item} threshold=\#{@threshold}"
  end
end

obj = GamePlayer.new("item_\#{rand(100)}", 98)
4.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
