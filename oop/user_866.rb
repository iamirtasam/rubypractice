# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :message, :speed

  def initialize(message, speed = 67)
    @message  = message
    @speed  = speed
    @index  = 0
    @history = []
  end

  def increment(amount = 12)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 12)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 67
    @history.clear
    self
  end

  def within_limit?(limit = 365)
    @speed <= limit
  end

  def summary
    {
      message: @message,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[ATM] #{message}=\#{@message} speed=\#{@speed}"
  end
end

obj = ATM.new("message_\#{rand(100)}", 67)
12.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
