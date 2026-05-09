# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :task, :average

  def initialize(task, average = 93)
    @task  = task
    @average  = average
    @count  = 0
    @history = []
  end

  def increment(amount = 18)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 18)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 93
    @history.clear
    self
  end

  def within_limit?(limit = 68)
    @average <= limit
  end

  def summary
    {
      task: @task,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[TodoList] #{task}=\#{@task} average=\#{@average}"
  end
end

obj = TodoList.new("task_\#{rand(100)}", 93)
18.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
