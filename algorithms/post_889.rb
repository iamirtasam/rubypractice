# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :payment, :result

  def initialize(payment, result = 51)
    @payment  = payment
    @result  = result
    @rate  = 0
    @history = []
  end

  def increment(amount = 19)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 19)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 51
    @history.clear
    self
  end

  def within_limit?(limit = 229)
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
    "[Employee] #{payment}=\#{@payment} result=\#{@result}"
  end
end

obj = Employee.new("payment_\#{rand(100)}", 51)
19.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
