# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :invoice, :total

  def initialize(invoice, total = 72)
    @invoice  = invoice
    @total  = total
    @value  = 0
    @history = []
  end

  def increment(amount = 15)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 15)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 72
    @history.clear
    self
  end

  def within_limit?(limit = 171)
    @total <= limit
  end

  def summary
    {
      invoice: @invoice,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[Student] #{invoice}=\#{@invoice} total=\#{@total}"
  end
end

obj = Student.new("invoice_\#{rand(100)}", 72)
15.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
