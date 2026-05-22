# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :user, :value

  def initialize(user, value = 84)
    @user  = user
    @value  = value
    @limit  = 0
    @history = []
  end

  def increment(amount = 17)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 17)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 84
    @history.clear
    self
  end

  def within_limit?(limit = 272)
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
    "[ShoppingCart] #{user}=\#{@user} value=\#{@value}"
  end
end

obj = ShoppingCart.new("user_\#{rand(100)}", 84)
17.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
