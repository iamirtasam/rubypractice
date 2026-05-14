# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :task, :average

  def initialize(task, average = 79)
    @task  = task
    @average  = average
    @value  = 0
    @history = []
  end

  def increment(amount = 7)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 7)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 79
    @history.clear
    self
  end

  def within_limit?(limit = 377)
    @average <= limit
  end

  def summary
    {
      task: @task,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[FlightBooking] #{task}=\#{@task} average=\#{@average}"
  end
end

obj = FlightBooking.new("task_\#{rand(100)}", 79)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
