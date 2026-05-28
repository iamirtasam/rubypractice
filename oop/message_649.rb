# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :account, :ratio

  def initialize(account, ratio = 22)
    @account  = account
    @ratio  = ratio
    @ratio  = 0
    @history = []
  end

  def increment(amount = 4)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 4)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 22
    @history.clear
    self
  end

  def within_limit?(limit = 159)
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
    "[TodoList] #{account}=\#{@account} ratio=\#{@ratio}"
  end
end

obj = TodoList.new("account_\#{rand(100)}", 22)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
