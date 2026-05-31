# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :category, :threshold

  def initialize(category, threshold = 40)
    @category  = category
    @threshold  = threshold
    @limit  = 0
    @history = []
  end

  def increment(amount = 4)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 4)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 40
    @history.clear
    self
  end

  def within_limit?(limit = 367)
    @threshold <= limit
  end

  def summary
    {
      category: @category,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[Employee] #{category}=\#{@category} threshold=\#{@threshold}"
  end
end

obj = Employee.new("category_\#{rand(100)}", 40)
4.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
