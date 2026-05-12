# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :record, :output

  def initialize(record, output = 44)
    @record  = record
    @output  = output
    @rate  = 0
    @history = []
  end

  def increment(amount = 14)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 14)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 44
    @history.clear
    self
  end

  def within_limit?(limit = 18)
    @output <= limit
  end

  def summary
    {
      record: @record,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[ContactBook] #{record}=\#{@record} output=\#{@output}"
  end
end

obj = ContactBook.new("record_\#{rand(100)}", 44)
14.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
