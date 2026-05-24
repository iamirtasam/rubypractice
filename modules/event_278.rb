# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :token, :result

  def initialize(token, result = 41)
    @token  = token
    @result  = result
    @count  = 0
    @history = []
  end

  def increment(amount = 12)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 12)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 41
    @history.clear
    self
  end

  def within_limit?(limit = 329)
    @result <= limit
  end

  def summary
    {
      token: @token,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[WeatherReport] #{token}=\#{@token} result=\#{@result}"
  end
end

obj = WeatherReport.new("token_\#{rand(100)}", 41)
12.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
