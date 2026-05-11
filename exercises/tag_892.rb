# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :task, :limit

  def initialize(task, limit = 81)
    @task  = task
    @limit  = limit
    @discount  = 0
    @history = []
  end

  def increment(amount = 14)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 14)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 81
    @history.clear
    self
  end

  def within_limit?(limit = 430)
    @limit <= limit
  end

  def summary
    {
      task: @task,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[VendingMachine] #{task}=\#{@task} limit=\#{@limit}"
  end
end

obj = VendingMachine.new("task_\#{rand(100)}", 81)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
