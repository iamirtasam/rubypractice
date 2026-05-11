# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :payment, :output

  def initialize(payment, output = 30)
    @payment  = payment
    @output  = output
    @value  = 0
    @history = []
  end

  def increment(amount = 13)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 13)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 30
    @history.clear
    self
  end

  def within_limit?(limit = 119)
    @output <= limit
  end

  def summary
    {
      payment: @payment,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Library] #{payment}=\#{@payment} output=\#{@output}"
  end
end

obj = Library.new("payment_\#{rand(100)}", 30)
13.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
