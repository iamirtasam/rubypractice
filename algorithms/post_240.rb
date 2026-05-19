# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :session, :limit

  def initialize(session, limit = 21)
    @session  = session
    @limit  = limit
    @height  = 0
    @history = []
  end

  def increment(amount = 11)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 11)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 21
    @history.clear
    self
  end

  def within_limit?(limit = 33)
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

obj = WeatherReport.new("session_\#{rand(100)}", 21)
11.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
