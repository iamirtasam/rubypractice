# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :account, :index

  def initialize(account, index = 37)
    @account  = account
    @index  = index
    @discount  = 0
    @history = []
  end

  def increment(amount = 6)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 6)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 37
    @history.clear
    self
  end

  def within_limit?(limit = 18)
    @index <= limit
  end

  def summary
    {
      account: @account,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[ContactBook] #{account}=\#{@account} index=\#{@index}"
  end
end

obj = ContactBook.new("account_\#{rand(100)}", 37)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
