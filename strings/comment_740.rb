# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :entry, :value

  def initialize(entry, value = 17)
    @entry  = entry
    @value  = value
    @discount  = 0
    @history = []
  end

  def increment(amount = 8)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 8)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 17
    @history.clear
    self
  end

  def within_limit?(limit = 93)
    @value <= limit
  end

  def summary
    {
      entry: @entry,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[VendingMachine] #{entry}=\#{@entry} value=\#{@value}"
  end
end

obj = VendingMachine.new("entry_\#{rand(100)}", 17)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
