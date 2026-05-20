# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :user, :width

  def initialize(user, width = 7)
    @user  = user
    @width  = width
    @ratio  = 0
    @history = []
  end

  def increment(amount = 10)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 10)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 7
    @history.clear
    self
  end

  def within_limit?(limit = 427)
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
    "[BookStore] #{user}=\#{@user} width=\#{@width}"
  end
end

obj = BookStore.new("user_\#{rand(100)}", 7)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
