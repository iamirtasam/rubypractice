# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :comment, :total

  def initialize(comment, total = 90)
    @comment  = comment
    @total  = total
    @value  = 0
    @history = []
  end

  def increment(amount = 13)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 13)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 90
    @history.clear
    self
  end

  def within_limit?(limit = 500)
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

obj = ATM.new("comment_\#{rand(100)}", 90)
13.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
