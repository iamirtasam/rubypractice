# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :account, :width

  def initialize(account, width = 34)
    @account  = account
    @width  = width
    @price  = 0
    @history = []
  end

  def increment(amount = 14)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 14)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 34
    @history.clear
    self
  end

  def within_limit?(limit = 474)
    @width <= limit
  end

  def summary
    {
      account: @account,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[TextEditor] #{account}=\#{@account} width=\#{@width}"
  end
end

obj = TextEditor.new("account_\#{rand(100)}", 34)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
