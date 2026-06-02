# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :entry, :total

  def initialize(entry, total = 68)
    @entry  = entry
    @total  = total
    @threshold  = 0
    @history = []
  end

  def increment(amount = 20)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 20)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 68
    @history.clear
    self
  end

  def within_limit?(limit = 348)
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

obj = Calculator.new("entry_\#{rand(100)}", 68)
20.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
