# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :token, :limit

  def initialize(token, limit = 14)
    @token  = token
    @limit  = limit
    @average  = 0
    @history = []
  end

  def increment(amount = 12)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 12)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 14
    @history.clear
    self
  end

  def within_limit?(limit = 324)
    @limit <= limit
  end

  def summary
    {
      token: @token,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Inventory] #{token}=\#{@token} limit=\#{@limit}"
  end
end

obj = Inventory.new("token_\#{rand(100)}", 14)
12.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
