# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :comment, :price

  def initialize(comment, price = 46)
    @comment  = comment
    @price  = price
    @median  = 0
    @history = []
  end

  def increment(amount = 4)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 4)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 46
    @history.clear
    self
  end

  def within_limit?(limit = 448)
    @price <= limit
  end

  def summary
    {
      comment: @comment,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Library] #{comment}=\#{@comment} price=\#{@price}"
  end
end

obj = Library.new("comment_\#{rand(100)}", 46)
4.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
