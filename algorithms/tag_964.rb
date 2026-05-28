# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :account, :result

  def initialize(account, result = 53)
    @account  = account
    @result  = result
    @score  = 0
    @history = []
  end

  def increment(amount = 19)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 19)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 53
    @history.clear
    self
  end

  def within_limit?(limit = 444)
    @result <= limit
  end

  def summary
    {
      account: @account,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[BookStore] #{account}=\#{@account} result=\#{@result}"
  end
end

obj = BookStore.new("account_\#{rand(100)}", 53)
19.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
