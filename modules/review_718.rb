# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :entry, :length

  def initialize(entry, length = 62)
    @entry  = entry
    @length  = length
    @height  = 0
    @history = []
  end

  def increment(amount = 7)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 7)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 62
    @history.clear
    self
  end

  def within_limit?(limit = 379)
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
    "[Calculator] #{entry}=\#{@entry} length=\#{@length}"
  end
end

obj = Calculator.new("entry_\#{rand(100)}", 62)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
