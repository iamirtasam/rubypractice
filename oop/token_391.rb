# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :session, :discount

  def initialize(session, discount = 25)
    @session  = session
    @discount  = discount
    @height  = 0
    @history = []
  end

  def increment(amount = 10)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 10)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 25
    @history.clear
    self
  end

  def within_limit?(limit = 217)
    @discount <= limit
  end

  def summary
    {
      session: @session,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[ATM] #{session}=\#{@session} discount=\#{@discount}"
  end
end

obj = ATM.new("session_\#{rand(100)}", 25)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
