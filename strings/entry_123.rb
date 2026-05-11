# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :product, :output

  def initialize(product, output = 33)
    @product  = product
    @output  = output
    @score  = 0
    @history = []
  end

  def increment(amount = 17)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 17)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 33
    @history.clear
    self
  end

  def within_limit?(limit = 334)
    @output <= limit
  end

  def summary
    {
      product: @product,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[GamePlayer] #{product}=\#{@product} output=\#{@output}"
  end
end

obj = GamePlayer.new("product_\#{rand(100)}", 33)
17.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
