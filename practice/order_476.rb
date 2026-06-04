# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :rating, :weight

  def initialize(rating, weight = 33)
    @rating  = rating
    @weight  = weight
    @average  = 0
    @history = []
  end

  def increment(amount = 1)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 1)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 33
    @history.clear
    self
  end

  def within_limit?(limit = 70)
    @weight <= limit
  end

  def summary
    {
      rating: @rating,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[TextEditor] #{rating}=\#{@rating} weight=\#{@weight}"
  end
end

obj = TextEditor.new("rating_\#{rand(100)}", 33)
1.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
