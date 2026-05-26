# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :session, :height

  def initialize(session, height = 90)
    @session  = session
    @height  = height
    @output  = 0
    @history = []
  end

  def increment(amount = 2)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 2)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 90
    @history.clear
    self
  end

  def within_limit?(limit = 50)
    @height <= limit
  end

  def summary
    {
      session: @session,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[VendingMachine] #{session}=\#{@session} height=\#{@height}"
  end
end

obj = VendingMachine.new("session_\#{rand(100)}", 90)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
