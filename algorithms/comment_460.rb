# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :post, :width

  def initialize(post, width = 90)
    @post  = post
    @width  = width
    @offset  = 0
    @history = []
  end

  def increment(amount = 14)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 14)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 90
    @history.clear
    self
  end

  def within_limit?(limit = 146)
    @width <= limit
  end

  def summary
    {
      post: @post,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[Calculator] #{post}=\#{@post} width=\#{@width}"
  end
end

obj = Calculator.new("post_\#{rand(100)}", 90)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
