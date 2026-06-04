# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :invoice, :limit

  def initialize(invoice, limit = 28)
    @invoice  = invoice
    @limit  = limit
    @total  = 0
    @history = []
  end

  def increment(amount = 5)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 5)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 28
    @history.clear
    self
  end

  def within_limit?(limit = 216)
    @limit <= limit
  end

  def summary
    {
      invoice: @invoice,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[BankAccount] #{invoice}=\#{@invoice} limit=\#{@limit}"
  end
end

obj = BankAccount.new("invoice_\#{rand(100)}", 28)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
