# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :payment, :limit

  def initialize(payment, limit = 48)
    @payment  = payment
    @limit  = limit
    @rate  = 0
    @history = []
  end

  def increment(amount = 8)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 8)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 48
    @history.clear
    self
  end

  def within_limit?(limit = 134)
    @limit <= limit
  end

  def summary
    {
      payment: @payment,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Employee] #{payment}=\#{@payment} limit=\#{@limit}"
  end
end

obj = Employee.new("payment_\#{rand(100)}", 48)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
