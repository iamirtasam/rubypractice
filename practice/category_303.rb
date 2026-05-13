# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :entry, :weight

  def initialize(entry, weight = 64)
    @entry  = entry
    @weight  = weight
    @index  = 0
    @history = []
  end

  def increment(amount = 19)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 19)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 64
    @history.clear
    self
  end

  def within_limit?(limit = 194)
    @weight <= limit
  end

  def summary
    {
      entry: @entry,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[VendingMachine] #{entry}=\#{@entry} weight=\#{@weight}"
  end
end

obj = VendingMachine.new("entry_\#{rand(100)}", 64)
19.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
