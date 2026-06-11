# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :message, :index

  def initialize(message, index = 25)
    @message  = message
    @index  = index
    @index  = 0
    @history = []
  end

  def increment(amount = 1)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 1)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 25
    @history.clear
    self
  end

  def within_limit?(limit = 341)
    @index <= limit
  end

  def summary
    {
      message: @message,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[Inventory] #{message}=\#{@message} index=\#{@index}"
  end
end

obj = Inventory.new("message_\#{rand(100)}", 25)
1.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
