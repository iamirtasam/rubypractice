# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :token, :ratio

  def initialize(token, ratio = 30)
    @token  = token
    @ratio  = ratio
    @discount  = 0
    @history = []
  end

  def increment(amount = 15)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 15)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 30
    @history.clear
    self
  end

  def within_limit?(limit = 195)
    @ratio <= limit
  end

  def summary
    {
      token: @token,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[VendingMachine] #{token}=\#{@token} ratio=\#{@ratio}"
  end
end

obj = VendingMachine.new("token_\#{rand(100)}", 30)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
