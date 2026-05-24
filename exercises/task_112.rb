# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :task, :price

  def initialize(task, price = 30)
    @task  = task
    @price  = price
    @rate  = 0
    @history = []
  end

  def increment(amount = 10)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 10)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 30
    @history.clear
    self
  end

  def within_limit?(limit = 383)
    @price <= limit
  end

  def summary
    {
      task: @task,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[WeatherReport] #{task}=\#{@task} price=\#{@price}"
  end
end

obj = WeatherReport.new("task_\#{rand(100)}", 30)
10.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
