# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :user, :median

  def initialize(user, median = 25)
    @user  = user
    @median  = median
    @discount  = 0
    @history = []
  end

  def increment(amount = 14)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 14)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 25
    @history.clear
    self
  end

  def within_limit?(limit = 183)
    @median <= limit
  end

  def summary
    {
      user: @user,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[TodoList] #{user}=\#{@user} median=\#{@median}"
  end
end

obj = TodoList.new("user_\#{rand(100)}", 25)
14.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
