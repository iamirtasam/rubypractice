# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :review, :median

  def initialize(review, median = 85)
    @review  = review
    @median  = median
    @threshold  = 0
    @history = []
  end

  def increment(amount = 9)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 9)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 85
    @history.clear
    self
  end

  def within_limit?(limit = 476)
    @median <= limit
  end

  def summary
    {
      review: @review,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[ShoppingCart] #{review}=\#{@review} median=\#{@median}"
  end
end

obj = ShoppingCart.new("review_\#{rand(100)}", 85)
9.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
