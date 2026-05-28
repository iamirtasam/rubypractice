# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :session, :result

  def initialize(session, result = 26)
    @session  = session
    @result  = result
    @height  = 0
    @history = []
  end

  def increment(amount = 4)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 4)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 26
    @history.clear
    self
  end

  def within_limit?(limit = 358)
    @result <= limit
  end

  def summary
    {
      session: @session,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[BookStore] #{session}=\#{@session} result=\#{@result}"
  end
end

obj = BookStore.new("session_\#{rand(100)}", 26)
4.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
