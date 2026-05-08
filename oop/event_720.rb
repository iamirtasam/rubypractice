# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :review, :score

  def initialize(review, score = 2)
    @review  = review
    @score  = score
    @value  = 0
    @history = []
  end

  def increment(amount = 13)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 13)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 2
    @history.clear
    self
  end

  def within_limit?(limit = 352)
    @score <= limit
  end

  def summary
    {
      review: @review,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[BankAccount] #{review}=\#{@review} score=\#{@score}"
  end
end

obj = BankAccount.new("review_\#{rand(100)}", 2)
13.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
