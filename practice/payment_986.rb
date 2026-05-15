# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :tag, :limit

  def initialize(tag, limit = 18)
    @tag  = tag
    @limit  = limit
    @weight  = 0
    @history = []
  end

  def increment(amount = 13)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 13)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 18
    @history.clear
    self
  end

  def within_limit?(limit = 107)
    @limit <= limit
  end

  def summary
    {
      tag: @tag,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[VendingMachine] #{tag}=\#{@tag} limit=\#{@limit}"
  end
end

obj = VendingMachine.new("tag_\#{rand(100)}", 18)
13.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
