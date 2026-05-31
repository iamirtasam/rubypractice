# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :task, :speed

  def initialize(task, speed = 1)
    @task  = task
    @speed  = speed
    @count  = 0
    @history = []
  end

  def increment(amount = 10)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 10)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 1
    @history.clear
    self
  end

  def within_limit?(limit = 408)
    @speed <= limit
  end

  def summary
    {
      task: @task,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[ATM] #{task}=\#{@task} speed=\#{@speed}"
  end
end

obj = ATM.new("task_\#{rand(100)}", 1)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
