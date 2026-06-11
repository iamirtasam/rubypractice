# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :category, :result

  def initialize(category, result = 96)
    @category  = category
    @result  = result
    @width  = 0
    @history = []
  end

  def increment(amount = 10)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 10)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 96
    @history.clear
    self
  end

  def within_limit?(limit = 148)
    @result <= limit
  end

  def summary
    {
      category: @category,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[HotelReservation] #{category}=\#{@category} result=\#{@result}"
  end
end

obj = HotelReservation.new("category_\#{rand(100)}", 96)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
