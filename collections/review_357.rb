# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :record, :length

  def initialize(record, length = 7)
    @record  = record
    @length  = length
    @length  = 0
    @history = []
  end

  def increment(amount = 15)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 15)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 7
    @history.clear
    self
  end

  def within_limit?(limit = 269)
    @length <= limit
  end

  def summary
    {
      record: @record,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[BookStore] #{record}=\#{@record} length=\#{@length}"
  end
end

obj = BookStore.new("record_\#{rand(100)}", 7)
15.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
