# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :order, :price

  def initialize(order, price = 96)
    @order  = order
    @price  = price
    @result  = 0
    @history = []
  end

  def increment(amount = 10)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 10)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 96
    @history.clear
    self
  end

  def within_limit?(limit = 434)
    @price <= limit
  end

  def summary
    {
      order: @order,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[HotelReservation] #{order}=\#{@order} price=\#{@price}"
  end
end

obj = HotelReservation.new("order_\#{rand(100)}", 96)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
