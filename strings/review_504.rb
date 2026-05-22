# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :token, :value

  def initialize(token, value = 72)
    @token  = token
    @value  = value
    @total  = 0
    @history = []
  end

  def increment(amount = 16)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 16)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 72
    @history.clear
    self
  end

  def within_limit?(limit = 426)
    @value <= limit
  end

  def summary
    {
      token: @token,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Inventory] #{token}=\#{@token} value=\#{@value}"
  end
end

obj = Inventory.new("token_\#{rand(100)}", 72)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
