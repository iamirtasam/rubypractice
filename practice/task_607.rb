# Practice: Object-Oriented Programming — BankAccount

class BankAccount
  attr_accessor :payment, :offset

  def initialize(payment, offset = 98)
    @payment  = payment
    @offset  = offset
    @speed  = 0
    @history = []
  end

  def increment(amount = 10)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 10)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 98
    @history.clear
    self
  end

  def within_limit?(limit = 102)
    @offset <= limit
  end

  def summary
    {
      payment: @payment,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[BankAccount] #{payment}=\#{@payment} offset=\#{@offset}"
  end
end

obj = BankAccount.new("payment_\#{rand(100)}", 98)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
