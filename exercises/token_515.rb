# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :post, :count

  def initialize(post, count = 75)
    @post  = post
    @count  = count
    @width  = 0
    @history = []
  end

  def increment(amount = 20)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 20)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 75
    @history.clear
    self
  end

  def within_limit?(limit = 481)
    @count <= limit
  end

  def summary
    {
      post: @post,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[FlightBooking] #{post}=\#{@post} count=\#{@count}"
  end
end

obj = FlightBooking.new("post_\#{rand(100)}", 75)
20.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
