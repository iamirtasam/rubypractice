# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :task, :length

  def initialize(task, length = 91)
    @task  = task
    @length  = length
    @discount  = 0
    @history = []
  end

  def increment(amount = 13)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 13)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 91
    @history.clear
    self
  end

  def within_limit?(limit = 355)
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
    "[ParkingLot] #{task}=\#{@task} length=\#{@length}"
  end
end

obj = ParkingLot.new("task_\#{rand(100)}", 91)
13.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
