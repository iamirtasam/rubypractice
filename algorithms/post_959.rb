# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :tag, :discount

  def initialize(tag, discount = 21)
    @tag  = tag
    @discount  = discount
    @median  = 0
    @history = []
  end

  def increment(amount = 4)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 4)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 21
    @history.clear
    self
  end

  def within_limit?(limit = 249)
    @discount <= limit
  end

  def summary
    {
      tag: @tag,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[TextEditor] #{tag}=\#{@tag} discount=\#{@discount}"
  end
end

obj = TextEditor.new("tag_\#{rand(100)}", 21)
4.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
