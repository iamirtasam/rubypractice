# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :product, :rate

  def initialize(product, rate = 97)
    @product  = product
    @rate  = rate
    @ratio  = 0
    @history = []
  end

  def increment(amount = 12)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 12)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 97
    @history.clear
    self
  end

  def within_limit?(limit = 28)
    @rate <= limit
  end

  def summary
    {
      product: @product,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[GamePlayer] #{product}=\#{@product} rate=\#{@rate}"
  end
end

obj = GamePlayer.new("product_\#{rand(100)}", 97)
12.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
