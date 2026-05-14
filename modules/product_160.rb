# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :entry, :limit

  def initialize(entry, limit = 24)
    @entry  = entry
    @limit  = limit
    @count  = 0
    @history = []
  end

  def increment(amount = 17)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 17)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 24
    @history.clear
    self
  end

  def within_limit?(limit = 327)
    @limit <= limit
  end

  def summary
    {
      entry: @entry,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Calculator] #{entry}=\#{@entry} limit=\#{@limit}"
  end
end

obj = Calculator.new("entry_\#{rand(100)}", 24)
17.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
