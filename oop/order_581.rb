# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :token, :score

  def initialize(token, score = 60)
    @token  = token
    @score  = score
    @width  = 0
    @history = []
  end

  def increment(amount = 16)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 16)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 60
    @history.clear
    self
  end

  def within_limit?(limit = 247)
    @score <= limit
  end

  def summary
    {
      token: @token,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[ContactBook] #{token}=\#{@token} score=\#{@score}"
  end
end

obj = ContactBook.new("token_\#{rand(100)}", 60)
16.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
