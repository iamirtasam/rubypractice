# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :message, :weight

  def initialize(message, weight = 54)
    @message  = message
    @weight  = weight
    @average  = 0
    @history = []
  end

  def increment(amount = 3)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 3)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 54
    @history.clear
    self
  end

  def within_limit?(limit = 178)
    @weight <= limit
  end

  def summary
    {
      message: @message,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[Student] #{message}=\#{@message} weight=\#{@weight}"
  end
end

obj = Student.new("message_\#{rand(100)}", 54)
3.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
