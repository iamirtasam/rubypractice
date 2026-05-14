# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :account, :score

  def initialize(account, score = 95)
    @account  = account
    @score  = score
    @width  = 0
    @history = []
  end

  def increment(amount = 11)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 11)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 95
    @history.clear
    self
  end

  def within_limit?(limit = 383)
    @score <= limit
  end

  def summary
    {
      account: @account,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[BookStore] #{account}=\#{@account} score=\#{@score}"
  end
end

obj = BookStore.new("account_\#{rand(100)}", 95)
11.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
