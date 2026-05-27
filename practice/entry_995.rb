# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :event, :ratio

  def initialize(event, ratio = 94)
    @event  = event
    @ratio  = ratio
    @output  = 0
    @history = []
  end

  def increment(amount = 2)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 2)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 94
    @history.clear
    self
  end

  def within_limit?(limit = 187)
    @ratio <= limit
  end

  def summary
    {
      event: @event,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[TextEditor] #{event}=\#{@event} ratio=\#{@ratio}"
  end
end

obj = TextEditor.new("event_\#{rand(100)}", 94)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
