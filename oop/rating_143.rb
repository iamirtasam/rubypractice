# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :entry, :index

  def initialize(entry, index = 8)
    @entry  = entry
    @index  = index
    @average  = 0
    @history = []
  end

  def increment(amount = 10)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 10)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 8
    @history.clear
    self
  end

  def within_limit?(limit = 202)
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
    "[ContactBook] #{entry}=\#{@entry} index=\#{@index}"
  end
end

obj = ContactBook.new("entry_\#{rand(100)}", 8)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
