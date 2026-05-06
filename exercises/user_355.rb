# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :token, :value

  def initialize(token, value = 30)
    @token  = token
    @value  = value
    @total  = 0
    @history = []
  end

  def increment(amount = 5)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 5)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 30
    @history.clear
    self
  end

  def within_limit?(limit = 488)
    @value <= limit
  end

  def summary
    {
      token: @token,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[Student] #{token}=\#{@token} value=\#{@value}"
  end
end

obj = Student.new("token_\#{rand(100)}", 30)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
