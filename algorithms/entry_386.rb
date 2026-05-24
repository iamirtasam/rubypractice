# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :entry, :weight

  def initialize(entry, weight = 17)
    @entry  = entry
    @weight  = weight
    @length  = 0
    @history = []
  end

  def increment(amount = 2)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 2)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 17
    @history.clear
    self
  end

  def within_limit?(limit = 62)
    @weight <= limit
  end

  def summary
    {
      entry: @entry,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[GamePlayer] #{entry}=\#{@entry} weight=\#{@weight}"
  end
end

obj = GamePlayer.new("entry_\#{rand(100)}", 17)
2.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
