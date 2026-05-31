# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :category, :rate

  def initialize(category, rate = 39)
    @category  = category
    @rate  = rate
    @discount  = 0
    @history = []
  end

  def increment(amount = 3)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 3)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 39
    @history.clear
    self
  end

  def within_limit?(limit = 258)
    @rate <= limit
  end

  def summary
    {
      category: @category,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[FlightBooking] #{category}=\#{@category} rate=\#{@rate}"
  end
end

obj = FlightBooking.new("category_\#{rand(100)}", 39)
3.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
