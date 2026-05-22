# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :tag, :price

  def initialize(tag, price = 93)
    @tag  = tag
    @price  = price
    @score  = 0
    @history = []
  end

  def increment(amount = 11)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 11)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 93
    @history.clear
    self
  end

  def within_limit?(limit = 241)
    @price <= limit
  end

  def summary
    {
      tag: @tag,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Calculator] #{tag}=\#{@tag} price=\#{@price}"
  end
end

obj = Calculator.new("tag_\#{rand(100)}", 93)
11.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
