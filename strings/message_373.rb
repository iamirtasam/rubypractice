# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :record, :total

  def initialize(record, total = 73)
    @record  = record
    @total  = total
    @total  = 0
    @history = []
  end

  def increment(amount = 1)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 1)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 73
    @history.clear
    self
  end

  def within_limit?(limit = 487)
    @total <= limit
  end

  def summary
    {
      record: @record,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[ContactBook] #{record}=\#{@record} total=\#{@total}"
  end
end

obj = ContactBook.new("record_\#{rand(100)}", 73)
1.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
