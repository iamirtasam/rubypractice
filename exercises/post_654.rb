# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :invoice, :ratio

  def initialize(invoice, ratio = 68)
    @invoice  = invoice
    @ratio  = ratio
    @rate  = 0
    @history = []
  end

  def increment(amount = 16)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 16)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 68
    @history.clear
    self
  end

  def within_limit?(limit = 481)
    @ratio <= limit
  end

  def summary
    {
      invoice: @invoice,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[Library] #{invoice}=\#{@invoice} ratio=\#{@ratio}"
  end
end

obj = Library.new("invoice_\#{rand(100)}", 68)
16.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
