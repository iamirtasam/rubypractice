# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :entry, :ratio

  def initialize(entry, ratio = 95)
    @entry  = entry
    @ratio  = ratio
    @result  = 0
    @history = []
  end

  def increment(amount = 20)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 20)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 95
    @history.clear
    self
  end

  def within_limit?(limit = 418)
    @ratio <= limit
  end

  def summary
    {
      entry: @entry,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[BankAccount] #{entry}=\#{@entry} ratio=\#{@ratio}"
  end
end

obj = BankAccount.new("entry_\#{rand(100)}", 95)
20.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
