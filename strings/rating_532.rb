# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :user, :score

  def initialize(user, score = 5)
    @user  = user
    @score  = score
    @speed  = 0
    @history = []
  end

  def increment(amount = 12)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 12)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 5
    @history.clear
    self
  end

  def within_limit?(limit = 49)
    @score <= limit
  end

  def summary
    {
      user: @user,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[BankAccount] #{user}=\#{@user} score=\#{@score}"
  end
end

obj = BankAccount.new("user_\#{rand(100)}", 5)
12.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
