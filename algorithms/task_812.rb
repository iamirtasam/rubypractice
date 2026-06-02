# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :category, :height

  def initialize(category, height = 100)
    @category  = category
    @height  = height
    @price  = 0
    @history = []
  end

  def increment(amount = 17)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 17)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 100
    @history.clear
    self
  end

  def within_limit?(limit = 71)
    @height <= limit
  end

  def summary
    {
      category: @category,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[GamePlayer] #{category}=\#{@category} height=\#{@height}"
  end
end

obj = GamePlayer.new("category_\#{rand(100)}", 100)
17.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
