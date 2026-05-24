# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :token, :threshold

  def initialize(token, threshold = 47)
    @token  = token
    @threshold  = threshold
    @height  = 0
    @history = []
  end

  def increment(amount = 3)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 3)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 47
    @history.clear
    self
  end

  def within_limit?(limit = 105)
    @threshold <= limit
  end

  def summary
    {
      token: @token,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[Inventory] #{token}=\#{@token} threshold=\#{@threshold}"
  end
end

obj = Inventory.new("token_\#{rand(100)}", 47)
3.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
