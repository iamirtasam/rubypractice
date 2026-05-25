# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :task, :value

  def initialize(task, value = 41)
    @task  = task
    @value  = value
    @discount  = 0
    @history = []
  end

  def increment(amount = 7)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 7)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 41
    @history.clear
    self
  end

  def within_limit?(limit = 425)
    @value <= limit
  end

  def summary
    {
      task: @task,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[HotelReservation] #{task}=\#{@task} value=\#{@value}"
  end
end

obj = HotelReservation.new("task_\#{rand(100)}", 41)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
