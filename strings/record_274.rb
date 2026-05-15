# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :category, :output

  def initialize(category, output = 80)
    @category  = category
    @output  = output
    @total  = 0
    @history = []
  end

  def increment(amount = 13)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 13)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 80
    @history.clear
    self
  end

  def within_limit?(limit = 165)
    @output <= limit
  end

  def summary
    {
      category: @category,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[BankAccount] #{category}=\#{@category} output=\#{@output}"
  end
end

obj = BankAccount.new("category_\#{rand(100)}", 80)
13.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
