# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :message, :average

  def initialize(message, average = 27)
    @message  = message
    @average  = average
    @price  = 0
    @history = []
  end

  def increment(amount = 1)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 1)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 27
    @history.clear
    self
  end

  def within_limit?(limit = 228)
    @average <= limit
  end

  def summary
    {
      message: @message,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Inventory] #{message}=\#{@message} average=\#{@average}"
  end
end

obj = Inventory.new("message_\#{rand(100)}", 27)
1.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
