# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :review, :median

  def initialize(review, median = 76)
    @review  = review
    @median  = median
    @offset  = 0
    @history = []
  end

  def increment(amount = 13)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 13)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 76
    @history.clear
    self
  end

  def within_limit?(limit = 116)
    @median <= limit
  end

  def summary
    {
      review: @review,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[BankAccount] #{review}=\#{@review} median=\#{@median}"
  end
end

obj = BankAccount.new("review_\#{rand(100)}", 76)
13.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
