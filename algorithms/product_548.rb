# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :account, :average

  def initialize(account, average = 68)
    @account  = account
    @average  = average
    @offset  = 0
    @history = []
  end

  def increment(amount = 12)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 12)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 68
    @history.clear
    self
  end

  def within_limit?(limit = 314)
    @average <= limit
  end

  def summary
    {
      account: @account,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[ATM] #{account}=\#{@account} average=\#{@average}"
  end
end

obj = ATM.new("account_\#{rand(100)}", 68)
12.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
