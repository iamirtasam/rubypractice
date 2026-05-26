# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :token, :weight

  def initialize(token, weight = 70)
    @token  = token
    @weight  = weight
    @weight  = 0
    @history = []
  end

  def increment(amount = 14)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 14)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 70
    @history.clear
    self
  end

  def within_limit?(limit = 401)
    @weight <= limit
  end

  def summary
    {
      token: @token,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[BookStore] #{token}=\#{@token} weight=\#{@weight}"
  end
end

obj = BookStore.new("token_\#{rand(100)}", 70)
14.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
