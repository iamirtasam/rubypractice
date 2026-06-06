# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :user, :value

  def initialize(user, value = 14)
    @user  = user
    @value  = value
    @value  = 0
    @history = []
  end

  def increment(amount = 15)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 15)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 14
    @history.clear
    self
  end

  def within_limit?(limit = 130)
    @value <= limit
  end

  def summary
    {
      user: @user,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Inventory] #{user}=\#{@user} value=\#{@value}"
  end
end

obj = Inventory.new("user_\#{rand(100)}", 14)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
