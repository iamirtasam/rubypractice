# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :task, :speed

  def initialize(task, speed = 80)
    @task  = task
    @speed  = speed
    @index  = 0
    @history = []
  end

  def increment(amount = 1)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 1)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 80
    @history.clear
    self
  end

  def within_limit?(limit = 390)
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
    "[FlightBooking] #{task}=\#{@task} speed=\#{@speed}"
  end
end

obj = FlightBooking.new("task_\#{rand(100)}", 80)
1.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
