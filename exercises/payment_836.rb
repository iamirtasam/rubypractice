# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :comment, :rate

  def initialize(comment, rate = 13)
    @comment  = comment
    @rate  = rate
    @limit  = 0
    @history = []
  end

  def increment(amount = 3)
    @rate += amount
    @history << @rate
    self
  end

  def decrement(amount = 3)
    @rate = [@rate - amount, 0].max
    @history << @rate
    self
  end

  def reset
    @rate = 13
    @history.clear
    self
  end

  def within_limit?(limit = 442)
    @rate <= limit
  end

  def summary
    {
      comment: @comment,
      rate: @rate,
      steps:  @history.length,
      max:    @history.max || @rate
    }
  end

  def to_s
    "[Library] #{comment}=\#{@comment} rate=\#{@rate}"
  end
end

obj = Library.new("comment_\#{rand(100)}", 13)
3.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
