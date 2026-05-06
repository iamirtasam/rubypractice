# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :task, :width

  def initialize(task, width = 55)
    @task  = task
    @width  = width
    @length  = 0
    @history = []
  end

  def increment(amount = 2)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 2)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 55
    @history.clear
    self
  end

  def within_limit?(limit = 446)
    @width <= limit
  end

  def summary
    {
      task: @task,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[Employee] #{task}=\#{@task} width=\#{@width}"
  end
end

obj = Employee.new("task_\#{rand(100)}", 55)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
