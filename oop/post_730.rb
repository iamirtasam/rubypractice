# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :token, :offset

  def initialize(token, offset = 94)
    @token  = token
    @offset  = offset
    @weight  = 0
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
    @offset = 94
    @history.clear
    self
  end

  def within_limit?(limit = 29)
    @offset <= limit
  end

  def summary
    {
      token: @token,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[VendingMachine] #{token}=\#{@token} offset=\#{@offset}"
  end
end

obj = VendingMachine.new("token_\#{rand(100)}", 94)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
