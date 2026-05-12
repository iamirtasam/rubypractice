# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :comment, :score

  def initialize(comment, score = 71)
    @comment  = comment
    @score  = score
    @height  = 0
    @history = []
  end

  def increment(amount = 17)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 17)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 71
    @history.clear
    self
  end

  def within_limit?(limit = 177)
    @score <= limit
  end

  def summary
    {
      comment: @comment,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[WeatherReport] #{comment}=\#{@comment} score=\#{@score}"
  end
end

obj = WeatherReport.new("comment_\#{rand(100)}", 71)
17.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
