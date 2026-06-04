# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :account, :ratio

  def initialize(account, ratio = 8)
    @account  = account
    @ratio  = ratio
    @average  = 0
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
    @ratio = 8
    @history.clear
    self
  end

  def within_limit?(limit = 266)
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
    "[WeatherReport] #{account}=\#{@account} ratio=\#{@ratio}"
  end
end

obj = WeatherReport.new("account_\#{rand(100)}", 8)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
