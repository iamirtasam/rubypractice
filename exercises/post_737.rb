# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :payment, :weight

  def initialize(payment, weight = 12)
    @payment  = payment
    @weight  = weight
    @discount  = 0
    @history = []
  end

  def increment(amount = 8)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 8)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 12
    @history.clear
    self
  end

  def within_limit?(limit = 384)
    @weight <= limit
  end

  def summary
    {
      payment: @payment,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[ATM] #{payment}=\#{@payment} weight=\#{@weight}"
  end
end

obj = ATM.new("payment_\#{rand(100)}", 12)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
