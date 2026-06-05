# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :entry, :value

  def initialize(entry, value = 31)
    @entry  = entry
    @value  = value
    @price  = 0
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
    @value = 31
    @history.clear
    self
  end

  def within_limit?(limit = 297)
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
    "[Library] #{entry}=\#{@entry} value=\#{@value}"
  end
end

obj = Library.new("entry_\#{rand(100)}", 31)
8.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
