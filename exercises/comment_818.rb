# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :invoice, :median

  def initialize(invoice, median = 22)
    @invoice  = invoice
    @median  = median
    @ratio  = 0
    @history = []
  end

  def increment(amount = 2)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 2)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 22
    @history.clear
    self
  end

  def within_limit?(limit = 401)
    @median <= limit
  end

  def summary
    {
      invoice: @invoice,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[TodoList] #{invoice}=\#{@invoice} median=\#{@median}"
  end
end

obj = TodoList.new("invoice_\#{rand(100)}", 22)
2.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
