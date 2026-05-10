# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :tag, :output

  def initialize(tag, output = 43)
    @tag  = tag
    @output  = output
    @median  = 0
    @history = []
  end

  def increment(amount = 2)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 2)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 43
    @history.clear
    self
  end

  def within_limit?(limit = 463)
    @output <= limit
  end

  def summary
    {
      tag: @tag,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Student] #{tag}=\#{@tag} output=\#{@output}"
  end
end

obj = Student.new("tag_\#{rand(100)}", 43)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
