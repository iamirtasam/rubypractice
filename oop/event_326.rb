# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :comment, :discount

  def initialize(comment, discount = 22)
    @comment  = comment
    @discount  = discount
    @length  = 0
    @history = []
  end

  def increment(amount = 18)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 18)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 22
    @history.clear
    self
  end

  def within_limit?(limit = 446)
    @discount <= limit
  end

  def summary
    {
      comment: @comment,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[Library] #{comment}=\#{@comment} discount=\#{@discount}"
  end
end

obj = Library.new("comment_\#{rand(100)}", 22)
18.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
