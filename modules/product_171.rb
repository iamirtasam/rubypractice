# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :message, :value

  def initialize(message, value = 76)
    @message  = message
    @value  = value
    @median  = 0
    @history = []
  end

  def increment(amount = 2)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 2)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 76
    @history.clear
    self
  end

  def within_limit?(limit = 321)
    @value <= limit
  end

  def summary
    {
      message: @message,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Calculator] #{message}=\#{@message} value=\#{@value}"
  end
end

obj = Calculator.new("message_\#{rand(100)}", 76)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
