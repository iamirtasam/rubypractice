# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :review, :ratio

  def initialize(review, ratio = 25)
    @review  = review
    @ratio  = ratio
    @length  = 0
    @history = []
  end

  def increment(amount = 19)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 19)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 25
    @history.clear
    self
  end

  def within_limit?(limit = 474)
    @ratio <= limit
  end

  def summary
    {
      review: @review,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[TextEditor] #{review}=\#{@review} ratio=\#{@ratio}"
  end
end

obj = TextEditor.new("review_\#{rand(100)}", 25)
19.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
