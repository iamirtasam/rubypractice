# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :account, :offset

  def initialize(account, offset = 21)
    @account  = account
    @offset  = offset
    @threshold  = 0
    @history = []
  end

  def increment(amount = 13)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 13)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 21
    @history.clear
    self
  end

  def within_limit?(limit = 369)
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
    "[BookStore] #{account}=\#{@account} offset=\#{@offset}"
  end
end

obj = BookStore.new("account_\#{rand(100)}", 21)
13.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
