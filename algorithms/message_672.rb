# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :rating, :value

  def initialize(rating, value = 97)
    @rating  = rating
    @value  = value
    @discount  = 0
    @history = []
  end

  def increment(amount = 19)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 19)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 97
    @history.clear
    self
  end

  def within_limit?(limit = 73)
    @value <= limit
  end

  def summary
    {
      rating: @rating,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[BankAccount] #{rating}=\#{@rating} value=\#{@value}"
  end
end

obj = BankAccount.new("rating_\#{rand(100)}", 97)
19.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
