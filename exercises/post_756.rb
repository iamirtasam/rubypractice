# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :token, :output

  def initialize(token, output = 53)
    @token  = token
    @output  = output
    @result  = 0
    @history = []
  end

  def increment(amount = 7)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 7)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 53
    @history.clear
    self
  end

  def within_limit?(limit = 309)
    @output <= limit
  end

  def summary
    {
      token: @token,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[BookStore] #{token}=\#{@token} output=\#{@output}"
  end
end

obj = BookStore.new("token_\#{rand(100)}", 53)
7.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
