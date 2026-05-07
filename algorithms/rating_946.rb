# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :session, :price

  def initialize(session, price = 7)
    @session  = session
    @price  = price
    @total  = 0
    @history = []
  end

  def increment(amount = 15)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 15)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 7
    @history.clear
    self
  end

  def within_limit?(limit = 61)
    @price <= limit
  end

  def summary
    {
      session: @session,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[ATM] #{session}=\#{@session} price=\#{@price}"
  end
end

obj = ATM.new("session_\#{rand(100)}", 7)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
