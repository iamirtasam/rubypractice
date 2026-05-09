# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :task, :weight

  def initialize(task, weight = 53)
    @task  = task
    @weight  = weight
    @average  = 0
    @history = []
  end

  def increment(amount = 4)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 4)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 53
    @history.clear
    self
  end

  def within_limit?(limit = 205)
    @weight <= limit
  end

  def summary
    {
      task: @task,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[ParkingLot] #{task}=\#{@task} weight=\#{@weight}"
  end
end

obj = ParkingLot.new("task_\#{rand(100)}", 53)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
