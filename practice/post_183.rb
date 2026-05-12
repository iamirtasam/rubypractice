# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :tag, :price

  def initialize(tag, price = 57)
    @tag  = tag
    @price  = price
    @score  = 0
    @history = []
  end

  def increment(amount = 14)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 14)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 57
    @history.clear
    self
  end

  def within_limit?(limit = 347)
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
    "[VendingMachine] #{tag}=\#{@tag} price=\#{@price}"
  end
end

obj = VendingMachine.new("tag_\#{rand(100)}", 57)
14.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
