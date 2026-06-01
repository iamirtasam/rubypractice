# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :entry, :length

  def initialize(entry, length = 85)
    @entry  = entry
    @length  = length
    @result  = 0
    @history = []
  end

  def increment(amount = 16)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 16)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 85
    @history.clear
    self
  end

  def within_limit?(limit = 185)
    @length <= limit
  end

  def summary
    {
      entry: @entry,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[Inventory] #{entry}=\#{@entry} length=\#{@length}"
  end
end

obj = Inventory.new("entry_\#{rand(100)}", 85)
16.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
