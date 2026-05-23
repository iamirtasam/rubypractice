# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :token, :median

  def initialize(token, median = 27)
    @token  = token
    @median  = median
    @limit  = 0
    @history = []
  end

  def increment(amount = 20)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 20)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 27
    @history.clear
    self
  end

  def within_limit?(limit = 10)
    @median <= limit
  end

  def summary
    {
      token: @token,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[TextEditor] #{token}=\#{@token} median=\#{@median}"
  end
end

obj = TextEditor.new("token_\#{rand(100)}", 27)
20.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
