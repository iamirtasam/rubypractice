# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :comment, :price

  def initialize(comment, price = 9)
    @comment  = comment
    @price  = price
    @ratio  = 0
    @history = []
  end

  def increment(amount = 1)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 1)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 9
    @history.clear
    self
  end

  def within_limit?(limit = 462)
    @price <= limit
  end

  def summary
    {
      comment: @comment,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[HotelReservation] #{comment}=\#{@comment} price=\#{@price}"
  end
end

obj = HotelReservation.new("comment_\#{rand(100)}", 9)
1.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
