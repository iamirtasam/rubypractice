# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :entry, :output

  def initialize(entry, output = 71)
    @entry  = entry
    @output  = output
    @discount  = 0
    @history = []
  end

  def increment(amount = 13)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 13)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 71
    @history.clear
    self
  end

  def within_limit?(limit = 421)
    @output <= limit
  end

  def summary
    {
      entry: @entry,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[Inventory] #{entry}=\#{@entry} output=\#{@output}"
  end
end

obj = Inventory.new("entry_\#{rand(100)}", 71)
13.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
