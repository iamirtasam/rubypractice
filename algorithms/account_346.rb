# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :category, :average

  def initialize(category, average = 97)
    @category  = category
    @average  = average
    @index  = 0
    @history = []
  end

  def increment(amount = 6)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 6)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 97
    @history.clear
    self
  end

  def within_limit?(limit = 427)
    @average <= limit
  end

  def summary
    {
      category: @category,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[BankAccount] #{category}=\#{@category} average=\#{@average}"
  end
end

obj = BankAccount.new("category_\#{rand(100)}", 97)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
