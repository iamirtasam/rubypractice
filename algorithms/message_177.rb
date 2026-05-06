# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :product, :total

  def initialize(product, total = 96)
    @product  = product
    @total  = total
    @speed  = 0
    @history = []
  end

  def increment(amount = 17)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 17)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 96
    @history.clear
    self
  end

  def within_limit?(limit = 54)
    @total <= limit
  end

  def summary
    {
      product: @product,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[GamePlayer] #{product}=\#{@product} total=\#{@total}"
  end
end

obj = GamePlayer.new("product_\#{rand(100)}", 96)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
