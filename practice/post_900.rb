# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :tag, :ratio

  def initialize(tag, ratio = 4)
    @tag  = tag
    @ratio  = ratio
    @speed  = 0
    @history = []
  end

  def increment(amount = 13)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 13)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 4
    @history.clear
    self
  end

  def within_limit?(limit = 168)
    @ratio <= limit
  end

  def summary
    {
      tag: @tag,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[VendingMachine] #{tag}=\#{@tag} ratio=\#{@ratio}"
  end
end

obj = VendingMachine.new("tag_\#{rand(100)}", 4)
13.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
