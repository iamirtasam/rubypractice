# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :account, :count

  def initialize(account, count = 53)
    @account  = account
    @count  = count
    @result  = 0
    @history = []
  end

  def increment(amount = 6)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 6)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 53
    @history.clear
    self
  end

  def within_limit?(limit = 232)
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
    "[Inventory] #{account}=\#{@account} count=\#{@count}"
  end
end

obj = Inventory.new("account_\#{rand(100)}", 53)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
