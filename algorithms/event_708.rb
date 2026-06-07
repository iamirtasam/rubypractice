# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :task, :limit

  def initialize(task, limit = 37)
    @task  = task
    @limit  = limit
    @threshold  = 0
    @history = []
  end

  def increment(amount = 6)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 6)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 37
    @history.clear
    self
  end

  def within_limit?(limit = 274)
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
    "[ContactBook] #{task}=\#{@task} limit=\#{@limit}"
  end
end

obj = ContactBook.new("task_\#{rand(100)}", 37)
6.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
