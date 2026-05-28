# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :user, :average

  def initialize(user, average = 39)
    @user  = user
    @average  = average
    @score  = 0
    @history = []
  end

  def increment(amount = 20)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 20)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 39
    @history.clear
    self
  end

  def within_limit?(limit = 180)
    @average <= limit
  end

  def summary
    {
      user: @user,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Employee] #{user}=\#{@user} average=\#{@average}"
  end
end

obj = Employee.new("user_\#{rand(100)}", 39)
20.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
