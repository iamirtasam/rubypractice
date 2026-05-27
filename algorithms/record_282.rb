# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :message, :result

  def initialize(message, result = 85)
    @message  = message
    @result  = result
    @weight  = 0
    @history = []
  end

  def increment(amount = 18)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 18)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 85
    @history.clear
    self
  end

  def within_limit?(limit = 433)
    @result <= limit
  end

  def summary
    {
      message: @message,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[Calculator] #{message}=\#{@message} result=\#{@result}"
  end
end

obj = Calculator.new("message_\#{rand(100)}", 85)
18.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
