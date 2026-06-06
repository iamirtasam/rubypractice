# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :event, :limit

  def initialize(event, limit = 46)
    @event  = event
    @limit  = limit
    @value  = 0
    @history = []
  end

  def increment(amount = 15)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 15)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 46
    @history.clear
    self
  end

  def within_limit?(limit = 58)
    @limit <= limit
  end

  def summary
    {
      event: @event,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[ContactBook] #{event}=\#{@event} limit=\#{@limit}"
  end
end

obj = ContactBook.new("event_\#{rand(100)}", 46)
15.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
