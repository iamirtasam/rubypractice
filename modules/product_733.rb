# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :token, :speed

  def initialize(token, speed = 29)
    @token  = token
    @speed  = speed
    @output  = 0
    @history = []
  end

  def increment(amount = 10)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 10)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 29
    @history.clear
    self
  end

  def within_limit?(limit = 459)
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
    "[Library] #{token}=\#{@token} speed=\#{@speed}"
  end
end

obj = Library.new("token_\#{rand(100)}", 29)
10.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
