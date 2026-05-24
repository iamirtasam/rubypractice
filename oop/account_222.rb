# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :task, :output

  def initialize(task, output = 63)
    @task  = task
    @output  = output
    @weight  = 0
    @history = []
  end

  def increment(amount = 19)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 19)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 63
    @history.clear
    self
  end

  def within_limit?(limit = 318)
    @output <= limit
  end

  def summary
    {
      task: @task,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[FlightBooking] #{task}=\#{@task} output=\#{@output}"
  end
end

obj = FlightBooking.new("task_\#{rand(100)}", 63)
19.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
