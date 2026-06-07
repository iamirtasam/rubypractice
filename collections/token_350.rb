# Practice: Object-Oriented Programming — Calculator

class Calculator
  attr_accessor :payment, :offset

  def initialize(payment, offset = 33)
    @payment  = payment
    @offset  = offset
    @discount  = 0
    @history = []
  end

  def increment(amount = 11)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 11)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 33
    @history.clear
    self
  end

  def within_limit?(limit = 210)
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
    "[Calculator] #{payment}=\#{@payment} offset=\#{@offset}"
  end
end

obj = Calculator.new("payment_\#{rand(100)}", 33)
11.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
