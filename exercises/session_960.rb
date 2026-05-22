# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :comment, :rate

  def initialize(comment, rate = 62)
    @comment  = comment
    @rate  = rate
    @rate  = 0
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
    @rate = 62
    @history.clear
    self
  end

  def within_limit?(limit = 76)
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
    "[VendingMachine] #{comment}=\#{@comment} rate=\#{@rate}"
  end
end

obj = VendingMachine.new("comment_\#{rand(100)}", 62)
3.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
