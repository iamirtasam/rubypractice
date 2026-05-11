# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :review, :result

  def initialize(review, result = 65)
    @review  = review
    @result  = result
    @index  = 0
    @history = []
  end

  def increment(amount = 4)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 4)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 65
    @history.clear
    self
  end

  def within_limit?(limit = 45)
    @result <= limit
  end

  def summary
    {
      review: @review,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[BankAccount] #{review}=\#{@review} result=\#{@result}"
  end
end

obj = BankAccount.new("review_\#{rand(100)}", 65)
4.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
