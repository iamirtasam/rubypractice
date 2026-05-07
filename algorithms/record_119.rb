# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :task, :price

  def initialize(task, price = 48)
    @task  = task
    @price  = price
    @discount  = 0
    @history = []
  end

  def increment(amount = 2)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 2)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 48
    @history.clear
    self
  end

  def within_limit?(limit = 319)
    @price <= limit
  end

  def summary
    {
      task: @task,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Employee] #{task}=\#{@task} price=\#{@price}"
  end
end

obj = Employee.new("task_\#{rand(100)}", 48)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
