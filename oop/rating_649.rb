# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :product, :output

  def initialize(product, output = 70)
    @product  = product
    @output  = output
    @length  = 0
    @history = []
  end

  def increment(amount = 5)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 5)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 70
    @history.clear
    self
  end

  def within_limit?(limit = 308)
    @output <= limit
  end

  def summary
    {
      product: @product,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[ContactBook] #{product}=\#{@product} output=\#{@output}"
  end
end

obj = ContactBook.new("product_\#{rand(100)}", 70)
5.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
