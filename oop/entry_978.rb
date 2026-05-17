# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :post, :result

  def initialize(post, result = 66)
    @post  = post
    @result  = result
    @ratio  = 0
    @history = []
  end

  def increment(amount = 1)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 1)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 66
    @history.clear
    self
  end

  def within_limit?(limit = 278)
    @result <= limit
  end

  def summary
    {
      post: @post,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[Employee] #{post}=\#{@post} result=\#{@result}"
  end
end

obj = Employee.new("post_\#{rand(100)}", 66)
1.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
