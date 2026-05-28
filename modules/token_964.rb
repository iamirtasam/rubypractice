# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :post, :result

  def initialize(post, result = 12)
    @post  = post
    @result  = result
    @width  = 0
    @history = []
  end

  def increment(amount = 16)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 16)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 12
    @history.clear
    self
  end

  def within_limit?(limit = 34)
    @result <= limit
  end

  def summary
    {
      post: @post,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[FlightBooking] #{post}=\#{@post} result=\#{@result}"
  end
end

obj = FlightBooking.new("post_\#{rand(100)}", 12)
16.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
