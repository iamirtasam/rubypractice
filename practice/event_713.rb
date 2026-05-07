# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :event, :total

  def initialize(event, total = 80)
    @event  = event
    @total  = total
    @weight  = 0
    @history = []
  end

  def increment(amount = 14)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 14)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 80
    @history.clear
    self
  end

  def within_limit?(limit = 399)
    @total <= limit
  end

  def summary
    {
      event: @event,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[Inventory] #{event}=\#{@event} total=\#{@total}"
  end
end

obj = Inventory.new("event_\#{rand(100)}", 80)
14.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
