# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :token, :speed

  def initialize(token, speed = 23)
    @token  = token
    @speed  = speed
    @index  = 0
    @history = []
  end

  def increment(amount = 8)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 8)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 23
    @history.clear
    self
  end

  def within_limit?(limit = 383)
    @speed <= limit
  end

  def summary
    {
      token: @token,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[WeatherReport] #{token}=\#{@token} speed=\#{@speed}"
  end
end

obj = WeatherReport.new("token_\#{rand(100)}", 23)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
