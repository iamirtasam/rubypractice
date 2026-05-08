# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :token, :speed

  def initialize(token, speed = 38)
    @token  = token
    @speed  = speed
    @index  = 0
    @history = []
  end

  def increment(amount = 11)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 11)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 38
    @history.clear
    self
  end

  def within_limit?(limit = 99)
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
    "[TextEditor] #{token}=\#{@token} speed=\#{@speed}"
  end
end

obj = TextEditor.new("token_\#{rand(100)}", 38)
11.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
