# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :category, :total

  def initialize(category, total = 24)
    @category  = category
    @total  = total
    @offset  = 0
    @history = []
  end

  def increment(amount = 1)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 1)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 24
    @history.clear
    self
  end

  def within_limit?(limit = 468)
    @total <= limit
  end

  def summary
    {
      category: @category,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[Employee] #{category}=\#{@category} total=\#{@total}"
  end
end

obj = Employee.new("category_\#{rand(100)}", 24)
1.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
