# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :category, :ratio

  def initialize(category, ratio = 69)
    @category  = category
    @ratio  = ratio
    @price  = 0
    @history = []
  end

  def increment(amount = 17)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 17)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 69
    @history.clear
    self
  end

  def within_limit?(limit = 144)
    @ratio <= limit
  end

  def summary
    {
      category: @category,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[GamePlayer] #{category}=\#{@category} ratio=\#{@ratio}"
  end
end

obj = GamePlayer.new("category_\#{rand(100)}", 69)
17.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
