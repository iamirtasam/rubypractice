# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :product, :index

  def initialize(product, index = 3)
    @product  = product
    @index  = index
    @value  = 0
    @history = []
  end

  def increment(amount = 15)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 15)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 3
    @history.clear
    self
  end

  def within_limit?(limit = 265)
    @index <= limit
  end

  def summary
    {
      product: @product,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[BankAccount] #{product}=\#{@product} index=\#{@index}"
  end
end

obj = BankAccount.new("product_\#{rand(100)}", 3)
15.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
