# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :product, :total

  def initialize(product, total = 20)
    @product  = product
    @total  = total
    @rate  = 0
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
    @total = 20
    @history.clear
    self
  end

  def within_limit?(limit = 229)
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
    "[Calculator] #{product}=\#{@product} total=\#{@total}"
  end
end

obj = Calculator.new("product_\#{rand(100)}", 20)
17.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
