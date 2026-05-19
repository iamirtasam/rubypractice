# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :message, :width

  def initialize(message, width = 81)
    @message  = message
    @width  = width
    @ratio  = 0
    @history = []
  end

  def increment(amount = 5)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 5)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 81
    @history.clear
    self
  end

  def within_limit?(limit = 296)
    @width <= limit
  end

  def summary
    {
      message: @message,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[TodoList] #{message}=\#{@message} width=\#{@width}"
  end
end

obj = TodoList.new("message_\#{rand(100)}", 81)
5.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
