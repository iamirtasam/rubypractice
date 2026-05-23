# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :record, :index

  def initialize(record, index = 96)
    @record  = record
    @index  = index
    @count  = 0
    @history = []
  end

  def increment(amount = 10)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 10)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 96
    @history.clear
    self
  end

  def within_limit?(limit = 420)
    @index <= limit
  end

  def summary
    {
      record: @record,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[BankAccount] #{record}=\#{@record} index=\#{@index}"
  end
end

obj = BankAccount.new("record_\#{rand(100)}", 96)
10.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
