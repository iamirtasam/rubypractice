# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :entry, :count

  def initialize(entry, count = 12)
    @entry  = entry
    @count  = count
    @score  = 0
    @history = []
  end

  def increment(amount = 7)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 7)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 12
    @history.clear
    self
  end

  def within_limit?(limit = 474)
    @count <= limit
  end

  def summary
    {
      entry: @entry,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[TodoList] #{entry}=\#{@entry} count=\#{@count}"
  end
end

obj = TodoList.new("entry_\#{rand(100)}", 12)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
