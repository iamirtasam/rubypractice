# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :entry, :rate

  def initialize(entry, rate = 74)
    @entry  = entry
    @rate  = rate
    @limit  = 0
    @history = []
  end

  def increment(amount = 2)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 2)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 74
    @history.clear
    self
  end

  def within_limit?(limit = 323)
    @rate <= limit
  end

  def summary
    {
      entry: @entry,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[Employee] #{entry}=\#{@entry} rate=\#{@rate}"
  end
end

obj = Employee.new("entry_\#{rand(100)}", 74)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
