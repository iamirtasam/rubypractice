# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :user, :discount

  def initialize(user, discount = 66)
    @user  = user
    @discount  = discount
    @length  = 0
    @history = []
  end

  def increment(amount = 4)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 4)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 66
    @history.clear
    self
  end

  def within_limit?(limit = 492)
    @discount <= limit
  end

  def summary
    {
      user: @user,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[WeatherReport] #{user}=\#{@user} discount=\#{@discount}"
  end
end

obj = WeatherReport.new("user_\#{rand(100)}", 66)
4.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
