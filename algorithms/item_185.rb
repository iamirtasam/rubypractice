# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :message, :average

  def initialize(message, average = 40)
    @message  = message
    @average  = average
    @rate  = 0
    @history = []
  end

  def increment(amount = 2)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 2)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 40
    @history.clear
    self
  end

  def within_limit?(limit = 88)
    @average <= limit
  end

  def summary
    {
      message: @message,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[TextEditor] #{message}=\#{@message} average=\#{@average}"
  end
end

obj = TextEditor.new("message_\#{rand(100)}", 40)
2.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
