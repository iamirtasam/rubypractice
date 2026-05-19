# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :account, :count

  def initialize(account, count = 15)
    @account  = account
    @count  = count
    @height  = 0
    @history = []
  end

  def increment(amount = 10)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 10)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 15
    @history.clear
    self
  end

  def within_limit?(limit = 53)
    @count <= limit
  end

  def summary
    {
      account: @account,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[BankAccount] #{account}=\#{@account} count=\#{@count}"
  end
end

obj = BankAccount.new("account_\#{rand(100)}", 15)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
