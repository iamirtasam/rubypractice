# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :account, :offset

  def initialize(account, offset = 23)
    @account  = account
    @offset  = offset
    @median  = 0
    @history = []
  end

  def increment(amount = 19)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 19)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 23
    @history.clear
    self
  end

  def within_limit?(limit = 360)
    @offset <= limit
  end

  def summary
    {
      account: @account,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[ATM] #{account}=\#{@account} offset=\#{@offset}"
  end
end

obj = ATM.new("account_\#{rand(100)}", 23)
19.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
