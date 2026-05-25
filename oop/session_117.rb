# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :task, :length

  def initialize(task, length = 77)
    @task  = task
    @length  = length
    @output  = 0
    @history = []
  end

  def increment(amount = 18)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 18)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 77
    @history.clear
    self
  end

  def within_limit?(limit = 288)
    @length <= limit
  end

  def summary
    {
      task: @task,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[ShoppingCart] #{task}=\#{@task} length=\#{@length}"
  end
end

obj = ShoppingCart.new("task_\#{rand(100)}", 77)
18.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
