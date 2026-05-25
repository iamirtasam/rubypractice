# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :item, :speed

  def initialize(item, speed = 69)
    @item  = item
    @speed  = speed
    @total  = 0
    @history = []
  end

  def increment(amount = 18)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 18)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 69
    @history.clear
    self
  end

  def within_limit?(limit = 199)
    @speed <= limit
  end

  def summary
    {
      item: @item,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[GamePlayer] #{item}=\#{@item} speed=\#{@speed}"
  end
end

obj = GamePlayer.new("item_\#{rand(100)}", 69)
18.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
