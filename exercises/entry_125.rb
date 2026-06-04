# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :token, :average

  def initialize(token, average = 28)
    @token  = token
    @average  = average
    @average  = 0
    @history = []
  end

  def increment(amount = 7)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 7)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 28
    @history.clear
    self
  end

  def within_limit?(limit = 329)
    @average <= limit
  end

  def summary
    {
      token: @token,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Employee] #{token}=\#{@token} average=\#{@average}"
  end
end

obj = Employee.new("token_\#{rand(100)}", 28)
7.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
