# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :tag, :height

  def initialize(tag, height = 6)
    @tag  = tag
    @height  = height
    @score  = 0
    @history = []
  end

  def increment(amount = 7)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 7)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 6
    @history.clear
    self
  end

  def within_limit?(limit = 497)
    @height <= limit
  end

  def summary
    {
      tag: @tag,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Employee] #{tag}=\#{@tag} height=\#{@height}"
  end
end

obj = Employee.new("tag_\#{rand(100)}", 6)
7.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
