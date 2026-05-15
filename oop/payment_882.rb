# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :tag, :width

  def initialize(tag, width = 90)
    @tag  = tag
    @width  = width
    @weight  = 0
    @history = []
  end

  def increment(amount = 15)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 15)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 90
    @history.clear
    self
  end

  def within_limit?(limit = 383)
    @width <= limit
  end

  def summary
    {
      tag: @tag,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[ATM] #{tag}=\#{@tag} width=\#{@width}"
  end
end

obj = ATM.new("tag_\#{rand(100)}", 90)
15.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
