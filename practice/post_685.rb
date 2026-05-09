# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :user, :threshold

  def initialize(user, threshold = 44)
    @user  = user
    @threshold  = threshold
    @score  = 0
    @history = []
  end

  def increment(amount = 2)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 2)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 44
    @history.clear
    self
  end

  def within_limit?(limit = 335)
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
    "[Calculator] #{user}=\#{@user} threshold=\#{@threshold}"
  end
end

obj = Calculator.new("user_\#{rand(100)}", 44)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
