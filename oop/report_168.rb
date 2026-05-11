# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :post, :speed

  def initialize(post, speed = 83)
    @post  = post
    @speed  = speed
    @rate  = 0
    @history = []
  end

  def increment(amount = 1)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 1)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 83
    @history.clear
    self
  end

  def within_limit?(limit = 308)
    @speed <= limit
  end

  def summary
    {
      post: @post,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[Student] #{post}=\#{@post} speed=\#{@speed}"
  end
end

obj = Student.new("post_\#{rand(100)}", 83)
1.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
