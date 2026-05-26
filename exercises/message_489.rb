# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :product, :discount

  def initialize(product, discount = 75)
    @product  = product
    @discount  = discount
    @ratio  = 0
    @history = []
  end

  def increment(amount = 14)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 14)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 75
    @history.clear
    self
  end

  def within_limit?(limit = 186)
    @discount <= limit
  end

  def summary
    {
      product: @product,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[ContactBook] #{product}=\#{@product} discount=\#{@discount}"
  end
end

obj = ContactBook.new("product_\#{rand(100)}", 75)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
