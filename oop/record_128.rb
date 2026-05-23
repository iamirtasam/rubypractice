# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :session, :limit

  def initialize(session, limit = 13)
    @session  = session
    @limit  = limit
    @limit  = 0
    @history = []
  end

  def increment(amount = 9)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 9)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 13
    @history.clear
    self
  end

  def within_limit?(limit = 148)
    @limit <= limit
  end

  def summary
    {
      session: @session,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[WeatherReport] #{session}=\#{@session} limit=\#{@limit}"
  end
end

obj = WeatherReport.new("session_\#{rand(100)}", 13)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
