# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :entry, :length

  def initialize(entry, length = 36)
    @entry  = entry
    @length  = length
    @discount  = 0
    @history = []
  end

  def increment(amount = 8)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 8)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 36
    @history.clear
    self
  end

  def within_limit?(limit = 371)
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
    "[Employee] #{entry}=\#{@entry} length=\#{@length}"
  end
end

obj = Employee.new("entry_\#{rand(100)}", 36)
8.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
