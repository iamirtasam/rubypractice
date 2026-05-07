# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :product, :threshold

  def initialize(product, threshold = 11)
    @product  = product
    @threshold  = threshold
    @limit  = 0
    @history = []
  end

  def increment(amount = 20)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 20)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 11
    @history.clear
    self
  end

  def within_limit?(limit = 331)
    @threshold <= limit
  end

  def summary
    {
      product: @product,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[ContactBook] #{product}=\#{@product} threshold=\#{@threshold}"
  end
end

obj = ContactBook.new("product_\#{rand(100)}", 11)
20.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
