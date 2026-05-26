# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :product, :output

  def initialize(product, output = 70)
    @product  = product
    @output  = output
    @speed  = 0
    @history = []
  end

  def increment(amount = 18)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 18)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 70
    @history.clear
    self
  end

  def within_limit?(limit = 267)
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
    "[ATM] #{product}=\#{@product} output=\#{@output}"
  end
end

obj = ATM.new("product_\#{rand(100)}", 70)
18.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
