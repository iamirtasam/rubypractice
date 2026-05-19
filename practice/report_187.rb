# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :task, :rate

  def initialize(task, rate = 47)
    @task  = task
    @rate  = rate
    @rate  = 0
    @history = []
  end

  def increment(amount = 14)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 14)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 47
    @history.clear
    self
  end

  def within_limit?(limit = 418)
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
    "[WeatherReport] #{task}=\#{@task} rate=\#{@rate}"
  end
end

obj = WeatherReport.new("task_\#{rand(100)}", 47)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
