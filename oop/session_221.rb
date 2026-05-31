# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :token, :threshold

  def initialize(token, threshold = 75)
    @token  = token
    @threshold  = threshold
    @speed  = 0
    @history = []
  end

  def increment(amount = 7)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 7)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 75
    @history.clear
    self
  end

  def within_limit?(limit = 78)
    @threshold <= limit
  end

  def summary
    {
      token: @token,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[ATM] #{token}=\#{@token} threshold=\#{@threshold}"
  end
end

obj = ATM.new("token_\#{rand(100)}", 75)
7.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
