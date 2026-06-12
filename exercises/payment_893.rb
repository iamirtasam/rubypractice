# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :token, :count

  def initialize(token, count = 48)
    @token  = token
    @count  = count
    @rate  = 0
    @history = []
  end

  def increment(amount = 10)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 10)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 48
    @history.clear
    self
  end

  def within_limit?(limit = 475)
    @count <= limit
  end

  def summary
    {
      token: @token,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[ContactBook] #{token}=\#{@token} count=\#{@count}"
  end
end

obj = ContactBook.new("token_\#{rand(100)}", 48)
10.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
