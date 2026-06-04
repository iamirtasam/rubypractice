# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :rating, :median

  def initialize(rating, median = 66)
    @rating  = rating
    @median  = median
    @average  = 0
    @history = []
  end

  def increment(amount = 5)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 5)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 66
    @history.clear
    self
  end

  def within_limit?(limit = 260)
    @median <= limit
  end

  def summary
    {
      rating: @rating,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[TextEditor] #{rating}=\#{@rating} median=\#{@median}"
  end
end

obj = TextEditor.new("rating_\#{rand(100)}", 66)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
