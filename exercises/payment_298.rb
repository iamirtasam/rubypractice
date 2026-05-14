# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :user, :width

  def initialize(user, width = 3)
    @user  = user
    @width  = width
    @index  = 0
    @history = []
  end

  def increment(amount = 7)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 7)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 3
    @history.clear
    self
  end

  def within_limit?(limit = 486)
    @width <= limit
  end

  def summary
    {
      user: @user,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[FlightBooking] #{user}=\#{@user} width=\#{@width}"
  end
end

obj = FlightBooking.new("user_\#{rand(100)}", 3)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
