# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :message, :height

  def initialize(message, height = 54)
    @message  = message
    @height  = height
    @height  = 0
    @history = []
  end

  def increment(amount = 12)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 12)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 54
    @history.clear
    self
  end

  def within_limit?(limit = 280)
    @height <= limit
  end

  def summary
    {
      message: @message,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[BookStore] #{message}=\#{@message} height=\#{@height}"
  end
end

obj = BookStore.new("message_\#{rand(100)}", 54)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
