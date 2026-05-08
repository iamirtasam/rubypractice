# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :message, :price

  def initialize(message, price = 3)
    @message  = message
    @price  = price
    @speed  = 0
    @history = []
  end

  def increment(amount = 14)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 14)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 3
    @history.clear
    self
  end

  def within_limit?(limit = 299)
    @price <= limit
  end

  def summary
    {
      message: @message,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Inventory] #{message}=\#{@message} price=\#{@price}"
  end
end

obj = Inventory.new("message_\#{rand(100)}", 3)
14.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
