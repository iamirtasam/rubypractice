# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :comment, :value

  def initialize(comment, value = 8)
    @comment  = comment
    @value  = value
    @output  = 0
    @history = []
  end

  def increment(amount = 9)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 9)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 8
    @history.clear
    self
  end

  def within_limit?(limit = 395)
    @value <= limit
  end

  def summary
    {
      comment: @comment,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[ContactBook] #{comment}=\#{@comment} value=\#{@value}"
  end
end

obj = ContactBook.new("comment_\#{rand(100)}", 8)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
