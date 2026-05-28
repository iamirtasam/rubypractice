# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :item, :value

  def initialize(item, value = 70)
    @item  = item
    @value  = value
    @speed  = 0
    @history = []
  end

  def increment(amount = 6)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 6)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 70
    @history.clear
    self
  end

  def within_limit?(limit = 454)
    @value <= limit
  end

  def summary
    {
      item: @item,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[BankAccount] #{item}=\#{@item} value=\#{@value}"
  end
end

obj = BankAccount.new("item_\#{rand(100)}", 70)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
