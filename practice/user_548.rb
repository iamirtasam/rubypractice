# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :task, :result

  def initialize(task, result = 81)
    @task  = task
    @result  = result
    @speed  = 0
    @history = []
  end

  def increment(amount = 7)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 7)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 81
    @history.clear
    self
  end

  def within_limit?(limit = 347)
    @result <= limit
  end

  def summary
    {
      task: @task,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[BookStore] #{task}=\#{@task} result=\#{@result}"
  end
end

obj = BookStore.new("task_\#{rand(100)}", 81)
7.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
