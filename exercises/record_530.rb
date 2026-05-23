# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :session, :threshold

  def initialize(session, threshold = 10)
    @session  = session
    @threshold  = threshold
    @total  = 0
    @history = []
  end

  def increment(amount = 17)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 17)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 10
    @history.clear
    self
  end

  def within_limit?(limit = 36)
    @threshold <= limit
  end

  def summary
    {
      session: @session,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[GamePlayer] #{session}=\#{@session} threshold=\#{@threshold}"
  end
end

obj = GamePlayer.new("session_\#{rand(100)}", 10)
17.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
