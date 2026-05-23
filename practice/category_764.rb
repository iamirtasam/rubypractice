# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :session, :median

  def initialize(session, median = 77)
    @session  = session
    @median  = median
    @count  = 0
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
    @median = 77
    @history.clear
    self
  end

  def within_limit?(limit = 139)
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

obj = GamePlayer.new("session_\#{rand(100)}", 77)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
