# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :session, :width

  def initialize(session, width = 98)
    @session  = session
    @width  = width
    @total  = 0
    @history = []
  end

  def increment(amount = 9)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 9)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 98
    @history.clear
    self
  end

  def within_limit?(limit = 413)
    @width <= limit
  end

  def summary
    {
      session: @session,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[Library] #{session}=\#{@session} width=\#{@width}"
  end
end

obj = Library.new("session_\#{rand(100)}", 98)
9.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
