# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :entry, :weight

  def initialize(entry, weight = 14)
    @entry  = entry
    @weight  = weight
    @width  = 0
    @history = []
  end

  def increment(amount = 1)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 1)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 14
    @history.clear
    self
  end

  def within_limit?(limit = 316)
    @weight <= limit
  end

  def summary
    {
      entry: @entry,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[BookStore] #{entry}=\#{@entry} weight=\#{@weight}"
  end
end

obj = BookStore.new("entry_\#{rand(100)}", 14)
1.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
