# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :category, :price

  def initialize(category, price = 94)
    @category  = category
    @price  = price
    @height  = 0
    @history = []
  end

  def increment(amount = 9)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 9)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 94
    @history.clear
    self
  end

  def within_limit?(limit = 277)
    @price <= limit
  end

  def summary
    {
      category: @category,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[GamePlayer] #{category}=\#{@category} price=\#{@price}"
  end
end

obj = GamePlayer.new("category_\#{rand(100)}", 94)
9.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
