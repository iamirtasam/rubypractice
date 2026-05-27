# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :review, :price

  def initialize(review, price = 29)
    @review  = review
    @price  = price
    @score  = 0
    @history = []
  end

  def increment(amount = 8)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 8)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 29
    @history.clear
    self
  end

  def within_limit?(limit = 126)
    @price <= limit
  end

  def summary
    {
      review: @review,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ATM] #{review}=\#{@review} price=\#{@price}"
  end
end

obj = ATM.new("review_\#{rand(100)}", 29)
8.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
