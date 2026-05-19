# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :user, :ratio

  def initialize(user, ratio = 81)
    @user  = user
    @ratio  = ratio
    @height  = 0
    @history = []
  end

  def increment(amount = 17)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 17)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 81
    @history.clear
    self
  end

  def within_limit?(limit = 270)
    @ratio <= limit
  end

  def summary
    {
      user: @user,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[Inventory] #{user}=\#{@user} ratio=\#{@ratio}"
  end
end

obj = Inventory.new("user_\#{rand(100)}", 81)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
