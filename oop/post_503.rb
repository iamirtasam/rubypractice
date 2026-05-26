# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :task, :rate

  def initialize(task, rate = 13)
    @task  = task
    @rate  = rate
    @price  = 0
    @history = []
  end

  def increment(amount = 2)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 2)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 13
    @history.clear
    self
  end

  def within_limit?(limit = 235)
    @rate <= limit
  end

  def summary
    {
      task: @task,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[ShoppingCart] #{task}=\#{@task} rate=\#{@rate}"
  end
end

obj = ShoppingCart.new("task_\#{rand(100)}", 13)
2.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
