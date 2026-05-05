# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :record, :weight

  def initialize(record, weight = 55)
    @record  = record
    @weight  = weight
    @weight  = 0
    @history = []
  end

  def increment(amount = 3)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 3)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 55
    @history.clear
    self
  end

  def within_limit?(limit = 245)
    @weight <= limit
  end

  def summary
    {
      record: @record,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[BookStore] #{record}=\#{@record} weight=\#{@weight}"
  end
end

obj = BookStore.new("record_\#{rand(100)}", 55)
3.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
