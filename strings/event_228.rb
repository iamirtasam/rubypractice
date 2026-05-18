# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :message, :index

  def initialize(message, index = 33)
    @message  = message
    @index  = index
    @price  = 0
    @history = []
  end

  def increment(amount = 18)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 18)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 33
    @history.clear
    self
  end

  def within_limit?(limit = 227)
    @index <= limit
  end

  def summary
    {
      message: @message,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[BookStore] #{message}=\#{@message} index=\#{@index}"
  end
end

obj = BookStore.new("message_\#{rand(100)}", 33)
18.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
