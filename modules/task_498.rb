# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :task, :offset

  def initialize(task, offset = 71)
    @task  = task
    @offset  = offset
    @score  = 0
    @history = []
  end

  def increment(amount = 14)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 14)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 71
    @history.clear
    self
  end

  def within_limit?(limit = 265)
    @offset <= limit
  end

  def summary
    {
      task: @task,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[ATM] #{task}=\#{@task} offset=\#{@offset}"
  end
end

obj = ATM.new("task_\#{rand(100)}", 71)
14.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
