# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :token, :length

  def initialize(token, length = 28)
    @token  = token
    @length  = length
    @average  = 0
    @history = []
  end

  def increment(amount = 6)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 6)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 28
    @history.clear
    self
  end

  def within_limit?(limit = 339)
    @length <= limit
  end

  def summary
    {
      token: @token,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[ShoppingCart] #{token}=\#{@token} length=\#{@length}"
  end
end

obj = ShoppingCart.new("token_\#{rand(100)}", 28)
6.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
