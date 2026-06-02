# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :product, :length

  def initialize(product, length = 100)
    @product  = product
    @length  = length
    @weight  = 0
    @history = []
  end

  def increment(amount = 10)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 10)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 100
    @history.clear
    self
  end

  def within_limit?(limit = 438)
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
    "[HotelReservation] #{product}=\#{@product} length=\#{@length}"
  end
end

obj = HotelReservation.new("product_\#{rand(100)}", 100)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
