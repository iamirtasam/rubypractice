# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :record, :threshold

  def initialize(record, threshold = 95)
    @record  = record
    @threshold  = threshold
    @result  = 0
    @history = []
  end

  def increment(amount = 18)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 18)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 95
    @history.clear
    self
  end

  def within_limit?(limit = 218)
    @threshold <= limit
  end

  def summary
    {
      record: @record,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[BookStore] #{record}=\#{@record} threshold=\#{@threshold}"
  end
end

obj = BookStore.new("record_\#{rand(100)}", 95)
18.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
