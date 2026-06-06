# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :product, :offset

  def initialize(product, offset = 58)
    @product  = product
    @offset  = offset
    @height  = 0
    @history = []
  end

  def increment(amount = 14)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 14)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 58
    @history.clear
    self
  end

  def within_limit?(limit = 246)
    @offset <= limit
  end

  def summary
    {
      product: @product,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[VendingMachine] #{product}=\#{@product} offset=\#{@offset}"
  end
end

obj = VendingMachine.new("product_\#{rand(100)}", 58)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
