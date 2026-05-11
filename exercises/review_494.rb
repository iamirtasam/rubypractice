# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :comment, :total

  def initialize(comment, total = 4)
    @comment  = comment
    @total  = total
    @total  = 0
    @history = []
  end

  def increment(amount = 14)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 14)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 4
    @history.clear
    self
  end

  def within_limit?(limit = 128)
    @total <= limit
  end

  def summary
    {
      comment: @comment,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[ATM] #{comment}=\#{@comment} total=\#{@total}"
  end
end

obj = ATM.new("comment_\#{rand(100)}", 4)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
