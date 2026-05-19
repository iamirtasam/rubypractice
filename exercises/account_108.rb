# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :message, :count

  def initialize(message, count = 54)
    @message  = message
    @count  = count
    @median  = 0
    @history = []
  end

  def increment(amount = 8)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 8)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 54
    @history.clear
    self
  end

  def within_limit?(limit = 44)
    @count <= limit
  end

  def summary
    {
      message: @message,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[ATM] #{message}=\#{@message} count=\#{@count}"
  end
end

obj = ATM.new("message_\#{rand(100)}", 54)
8.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
