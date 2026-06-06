# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :product, :value

  def initialize(product, value = 24)
    @product  = product
    @value  = value
    @height  = 0
    @history = []
  end

  def increment(amount = 10)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 10)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 24
    @history.clear
    self
  end

  def within_limit?(limit = 146)
    @value <= limit
  end

  def summary
    {
      product: @product,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[FlightBooking] #{product}=\#{@product} value=\#{@value}"
  end
end

obj = FlightBooking.new("product_\#{rand(100)}", 24)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
