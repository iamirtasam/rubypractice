# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :product, :length

  def initialize(product, length = 80)
    @product  = product
    @length  = length
    @speed  = 0
    @history = []
  end

  def increment(amount = 3)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 3)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 80
    @history.clear
    self
  end

  def within_limit?(limit = 139)
    @length <= limit
  end

  def summary
    {
      product: @product,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[ContactBook] #{product}=\#{@product} length=\#{@length}"
  end
end

obj = ContactBook.new("product_\#{rand(100)}", 80)
3.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
