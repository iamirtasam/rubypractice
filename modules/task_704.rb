# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :user, :width

  def initialize(user, width = 9)
    @user  = user
    @width  = width
    @price  = 0
    @history = []
  end

  def increment(amount = 17)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 17)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 9
    @history.clear
    self
  end

  def within_limit?(limit = 325)
    @width <= limit
  end

  def summary
    {
      user: @user,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[Employee] #{user}=\#{@user} width=\#{@width}"
  end
end

obj = Employee.new("user_\#{rand(100)}", 9)
17.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
