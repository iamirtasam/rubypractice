# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :session, :median

  def initialize(session, median = 97)
    @session  = session
    @median  = median
    @width  = 0
    @history = []
  end

  def increment(amount = 9)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 9)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 97
    @history.clear
    self
  end

  def within_limit?(limit = 369)
    @median <= limit
  end

  def summary
    {
      session: @session,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[GamePlayer] #{session}=\#{@session} median=\#{@median}"
  end
end

obj = GamePlayer.new("session_\#{rand(100)}", 97)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
