# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :payment, :result

  def initialize(payment, result = 92)
    @payment  = payment
    @result  = result
    @limit  = 0
    @history = []
  end

  def increment(amount = 6)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 6)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 92
    @history.clear
    self
  end

  def within_limit?(limit = 201)
    @result <= limit
  end

  def summary
    {
      payment: @payment,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[ContactBook] #{payment}=\#{@payment} result=\#{@result}"
  end
end

obj = ContactBook.new("payment_\#{rand(100)}", 92)
6.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
