# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :payment, :threshold

  def initialize(payment, threshold = 27)
    @payment  = payment
    @threshold  = threshold
    @median  = 0
    @history = []
  end

  def increment(amount = 5)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 5)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 27
    @history.clear
    self
  end

  def within_limit?(limit = 357)
    @threshold <= limit
  end

  def summary
    {
      payment: @payment,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[ATM] #{payment}=\#{@payment} threshold=\#{@threshold}"
  end
end

obj = ATM.new("payment_\#{rand(100)}", 27)
5.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
