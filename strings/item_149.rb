# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :session, :ratio

  def initialize(session, ratio = 74)
    @session  = session
    @ratio  = ratio
    @price  = 0
    @history = []
  end

  def increment(amount = 3)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 3)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 74
    @history.clear
    self
  end

  def within_limit?(limit = 117)
    @ratio <= limit
  end

  def summary
    {
      session: @session,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[GamePlayer] #{session}=\#{@session} ratio=\#{@ratio}"
  end
end

obj = GamePlayer.new("session_\#{rand(100)}", 74)
3.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
