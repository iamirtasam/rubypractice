# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :category, :ratio

  def initialize(category, ratio = 62)
    @category  = category
    @ratio  = ratio
    @discount  = 0
    @history = []
  end

  def increment(amount = 6)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 6)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 62
    @history.clear
    self
  end

  def within_limit?(limit = 171)
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
    "[Calculator] #{category}=\#{@category} ratio=\#{@ratio}"
  end
end

obj = Calculator.new("category_\#{rand(100)}", 62)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
