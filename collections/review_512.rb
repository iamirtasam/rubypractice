# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :product, :weight

  def initialize(product, weight = 48)
    @product  = product
    @weight  = weight
    @rate  = 0
    @history = []
  end

  def increment(amount = 12)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 12)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 48
    @history.clear
    self
  end

  def within_limit?(limit = 73)
    @weight <= limit
  end

  def summary
    {
      product: @product,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[BankAccount] #{product}=\#{@product} weight=\#{@weight}"
  end
end

obj = BankAccount.new("product_\#{rand(100)}", 48)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
