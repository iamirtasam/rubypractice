# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :session, :length

  def initialize(session, length = 18)
    @session  = session
    @length  = length
    @speed  = 0
    @history = []
  end

  def increment(amount = 2)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 2)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 18
    @history.clear
    self
  end

  def within_limit?(limit = 53)
    @length <= limit
  end

  def summary
    {
      session: @session,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[ShoppingCart] #{session}=\#{@session} length=\#{@length}"
  end
end

obj = ShoppingCart.new("session_\#{rand(100)}", 18)
2.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
