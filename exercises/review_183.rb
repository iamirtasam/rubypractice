# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :user, :length

  def initialize(user, length = 53)
    @user  = user
    @length  = length
    @price  = 0
    @history = []
  end

  def increment(amount = 9)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 9)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 53
    @history.clear
    self
  end

  def within_limit?(limit = 462)
    @length <= limit
  end

  def summary
    {
      user: @user,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[TodoList] #{user}=\#{@user} length=\#{@length}"
  end
end

obj = TodoList.new("user_\#{rand(100)}", 53)
9.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
