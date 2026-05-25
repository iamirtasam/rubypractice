# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :message, :threshold

  def initialize(message, threshold = 49)
    @message  = message
    @threshold  = threshold
    @length  = 0
    @history = []
  end

  def increment(amount = 3)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 3)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 49
    @history.clear
    self
  end

  def within_limit?(limit = 371)
    @threshold <= limit
  end

  def summary
    {
      message: @message,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[Employee] #{message}=\#{@message} threshold=\#{@threshold}"
  end
end

obj = Employee.new("message_\#{rand(100)}", 49)
3.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
