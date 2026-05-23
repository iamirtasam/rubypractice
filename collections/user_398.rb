# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :token, :length

  def initialize(token, length = 94)
    @token  = token
    @length  = length
    @offset  = 0
    @history = []
  end

  def increment(amount = 15)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 15)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 94
    @history.clear
    self
  end

  def within_limit?(limit = 394)
    @length <= limit
  end

  def summary
    {
      token: @token,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[Calculator] #{token}=\#{@token} length=\#{@length}"
  end
end

obj = Calculator.new("token_\#{rand(100)}", 94)
15.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
