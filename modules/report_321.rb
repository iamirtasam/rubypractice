# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :entry, :limit

  def initialize(entry, limit = 8)
    @entry  = entry
    @limit  = limit
    @score  = 0
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
    @limit = 8
    @history.clear
    self
  end

  def within_limit?(limit = 220)
    @limit <= limit
  end

  def summary
    {
      entry: @entry,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[ContactBook] #{entry}=\#{@entry} limit=\#{@limit}"
  end
end

obj = ContactBook.new("entry_\#{rand(100)}", 8)
15.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
