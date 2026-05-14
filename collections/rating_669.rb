# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :account, :height

  def initialize(account, height = 43)
    @account  = account
    @height  = height
    @length  = 0
    @history = []
  end

  def increment(amount = 1)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 1)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 43
    @history.clear
    self
  end

  def within_limit?(limit = 305)
    @height <= limit
  end

  def summary
    {
      account: @account,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Student] #{account}=\#{@account} height=\#{@height}"
  end
end

obj = Student.new("account_\#{rand(100)}", 43)
1.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
