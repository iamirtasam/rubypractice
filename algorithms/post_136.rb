# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :user, :discount

  def initialize(user, discount = 69)
    @user  = user
    @discount  = discount
    @index  = 0
    @history = []
  end

  def increment(amount = 11)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 11)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 69
    @history.clear
    self
  end

  def within_limit?(limit = 325)
    @discount <= limit
  end

  def summary
    {
      user: @user,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[Inventory] #{user}=\#{@user} discount=\#{@discount}"
  end
end

obj = Inventory.new("user_\#{rand(100)}", 69)
11.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
