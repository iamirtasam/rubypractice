# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :user, :height

  def initialize(user, height = 23)
    @user  = user
    @height  = height
    @median  = 0
    @history = []
  end

  def increment(amount = 12)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 12)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 23
    @history.clear
    self
  end

  def within_limit?(limit = 173)
    @height <= limit
  end

  def summary
    {
      user: @user,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Student] #{user}=\#{@user} height=\#{@height}"
  end
end

obj = Student.new("user_\#{rand(100)}", 23)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
