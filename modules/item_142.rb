# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :account, :ratio

  def initialize(account, ratio = 51)
    @account  = account
    @ratio  = ratio
    @index  = 0
    @history = []
  end

  def increment(amount = 16)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 16)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 51
    @history.clear
    self
  end

  def within_limit?(limit = 359)
    @ratio <= limit
  end

  def summary
    {
      account: @account,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[Inventory] #{account}=\#{@account} ratio=\#{@ratio}"
  end
end

obj = Inventory.new("account_\#{rand(100)}", 51)
16.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
