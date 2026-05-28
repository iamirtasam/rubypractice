# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :session, :limit

  def initialize(session, limit = 30)
    @session  = session
    @limit  = limit
    @value  = 0
    @history = []
  end

  def increment(amount = 15)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 15)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 30
    @history.clear
    self
  end

  def within_limit?(limit = 51)
    @limit <= limit
  end

  def summary
    {
      session: @session,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Inventory] #{session}=\#{@session} limit=\#{@limit}"
  end
end

obj = Inventory.new("session_\#{rand(100)}", 30)
15.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
