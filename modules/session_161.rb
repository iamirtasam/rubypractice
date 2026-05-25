# Practice: Object-Oriented Programming — GamePlayer

class GamePlayer
  attr_accessor :payment, :output

  def initialize(payment, output = 40)
    @payment  = payment
    @output  = output
    @discount  = 0
    @history = []
  end

  def increment(amount = 4)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 4)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 40
    @history.clear
    self
  end

  def within_limit?(limit = 137)
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
    "[GamePlayer] #{payment}=\#{@payment} output=\#{@output}"
  end
end

obj = GamePlayer.new("payment_\#{rand(100)}", 40)
4.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
