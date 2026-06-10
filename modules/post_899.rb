# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :account, :weight

  def initialize(account, weight = 12)
    @account  = account
    @weight  = weight
    @price  = 0
    @history = []
  end

  def increment(amount = 5)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 5)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 12
    @history.clear
    self
  end

  def within_limit?(limit = 420)
    @weight <= limit
  end

  def summary
    {
      account: @account,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[WeatherReport] #{account}=\#{@account} weight=\#{@weight}"
  end
end

obj = WeatherReport.new("account_\#{rand(100)}", 12)
5.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
