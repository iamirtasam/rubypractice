# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :payment, :threshold

  def initialize(payment, threshold = 28)
    @payment  = payment
    @threshold  = threshold
    @result  = 0
    @history = []
  end

  def increment(amount = 6)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 6)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 28
    @history.clear
    self
  end

  def within_limit?(limit = 228)
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
    "[TodoList] #{payment}=\#{@payment} threshold=\#{@threshold}"
  end
end

obj = TodoList.new("payment_\#{rand(100)}", 28)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
