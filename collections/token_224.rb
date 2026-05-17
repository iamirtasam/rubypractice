# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :task, :output

  def initialize(task, output = 100)
    @task  = task
    @output  = output
    @offset  = 0
    @history = []
  end

  def increment(amount = 7)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 7)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 100
    @history.clear
    self
  end

  def within_limit?(limit = 397)
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
    "[GamePlayer] #{task}=\#{@task} output=\#{@output}"
  end
end

obj = GamePlayer.new("task_\#{rand(100)}", 100)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
