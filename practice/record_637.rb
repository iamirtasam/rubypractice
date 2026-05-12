# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :user, :threshold

  def initialize(user, threshold = 73)
    @user  = user
    @threshold  = threshold
    @price  = 0
    @history = []
  end

  def increment(amount = 18)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 18)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 73
    @history.clear
    self
  end

  def within_limit?(limit = 173)
    @threshold <= limit
  end

  def summary
    {
      user: @user,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[Inventory] #{user}=\#{@user} threshold=\#{@threshold}"
  end
end

obj = Inventory.new("user_\#{rand(100)}", 73)
18.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
