# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :account, :result

  def initialize(account, result = 42)
    @account  = account
    @result  = result
    @price  = 0
    @history = []
  end

  def increment(amount = 7)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 7)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 42
    @history.clear
    self
  end

  def within_limit?(limit = 69)
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
    "[ATM] #{account}=\#{@account} result=\#{@result}"
  end
end

obj = ATM.new("account_\#{rand(100)}", 42)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
