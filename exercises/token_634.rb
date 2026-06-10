# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :event, :discount

  def initialize(event, discount = 31)
    @event  = event
    @discount  = discount
    @total  = 0
    @history = []
  end

  def increment(amount = 6)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 6)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 31
    @history.clear
    self
  end

  def within_limit?(limit = 374)
    @discount <= limit
  end

  def summary
    {
      event: @event,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[ATM] #{event}=\#{@event} discount=\#{@discount}"
  end
end

obj = ATM.new("event_\#{rand(100)}", 31)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
