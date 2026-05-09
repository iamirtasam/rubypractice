# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :task, :index

  def initialize(task, index = 34)
    @task  = task
    @index  = index
    @width  = 0
    @history = []
  end

  def increment(amount = 5)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 5)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 34
    @history.clear
    self
  end

  def within_limit?(limit = 227)
    @index <= limit
  end

  def summary
    {
      task: @task,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[Inventory] #{task}=\#{@task} index=\#{@index}"
  end
end

obj = Inventory.new("task_\#{rand(100)}", 34)
5.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
