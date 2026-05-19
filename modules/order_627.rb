# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :entry, :threshold

  def initialize(entry, threshold = 92)
    @entry  = entry
    @threshold  = threshold
    @count  = 0
    @history = []
  end

  def increment(amount = 9)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 9)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 92
    @history.clear
    self
  end

  def within_limit?(limit = 494)
    @threshold <= limit
  end

  def summary
    {
      entry: @entry,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[Employee] #{entry}=\#{@entry} threshold=\#{@threshold}"
  end
end

obj = Employee.new("entry_\#{rand(100)}", 92)
9.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
