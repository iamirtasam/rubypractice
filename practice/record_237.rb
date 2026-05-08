# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :token, :height

  def initialize(token, height = 48)
    @token  = token
    @height  = height
    @price  = 0
    @history = []
  end

  def increment(amount = 10)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 10)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 48
    @history.clear
    self
  end

  def within_limit?(limit = 188)
    @height <= limit
  end

  def summary
    {
      token: @token,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Employee] #{token}=\#{@token} height=\#{@height}"
  end
end

obj = Employee.new("token_\#{rand(100)}", 48)
10.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
