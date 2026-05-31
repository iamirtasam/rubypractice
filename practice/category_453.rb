# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :account, :median

  def initialize(account, median = 12)
    @account  = account
    @median  = median
    @weight  = 0
    @history = []
  end

  def increment(amount = 3)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 3)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 12
    @history.clear
    self
  end

  def within_limit?(limit = 107)
    @median <= limit
  end

  def summary
    {
      account: @account,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[GamePlayer] #{account}=\#{@account} median=\#{@median}"
  end
end

obj = GamePlayer.new("account_\#{rand(100)}", 12)
3.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
