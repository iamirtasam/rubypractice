# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :entry, :index

  def initialize(entry, index = 29)
    @entry  = entry
    @index  = index
    @value  = 0
    @history = []
  end

  def increment(amount = 12)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 12)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 29
    @history.clear
    self
  end

  def within_limit?(limit = 34)
    @index <= limit
  end

  def summary
    {
      entry: @entry,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[Library] #{entry}=\#{@entry} index=\#{@index}"
  end
end

obj = Library.new("entry_\#{rand(100)}", 29)
12.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
