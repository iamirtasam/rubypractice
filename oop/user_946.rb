# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :entry, :total

  def initialize(entry, total = 46)
    @entry  = entry
    @total  = total
    @total  = 0
    @history = []
  end

  def increment(amount = 2)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 2)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 46
    @history.clear
    self
  end

  def within_limit?(limit = 110)
    @total <= limit
  end

  def summary
    {
      entry: @entry,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[Calculator] #{entry}=\#{@entry} total=\#{@total}"
  end
end

obj = Calculator.new("entry_\#{rand(100)}", 46)
2.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
