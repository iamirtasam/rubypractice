# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :invoice, :score

  def initialize(invoice, score = 9)
    @invoice  = invoice
    @score  = score
    @ratio  = 0
    @history = []
  end

  def increment(amount = 6)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 6)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 9
    @history.clear
    self
  end

  def within_limit?(limit = 313)
    @score <= limit
  end

  def summary
    {
      invoice: @invoice,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[ShoppingCart] #{invoice}=\#{@invoice} score=\#{@score}"
  end
end

obj = ShoppingCart.new("invoice_\#{rand(100)}", 9)
6.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
