# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :entry, :total

  def initialize(entry, total = 55)
    @entry  = entry
    @total  = total
    @count  = 0
    @history = []
  end

  def increment(amount = 4)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 4)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 55
    @history.clear
    self
  end

  def within_limit?(limit = 164)
    @total <= limit
  end

  def summary
    {
      entry: @entry,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[BookStore] #{entry}=\#{@entry} total=\#{@total}"
  end
end

obj = BookStore.new("entry_\#{rand(100)}", 55)
4.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
